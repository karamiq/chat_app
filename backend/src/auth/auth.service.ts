import { BadRequestException, Injectable, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config/dist/config.service';
import { PrismaService } from 'src/prisma.service';
import { JwtService } from '@nestjs/jwt';
import { Request, Response } from 'express';
import { User } from '@prisma/client';
import { LoginDto, RegisterDto } from './dto';
import * as bcrypt from 'bcrypt';
@Injectable()
export class AuthService {

    constructor(
        private readonly prisma: PrismaService,
        private readonly jwtService: JwtService,
        private readonly configService: ConfigService
    ) { }


    async refreshToken(req: Request, res: Response) {
        const refreshToken = req.cookies['refresh_token'];
        if (!refreshToken) {
            throw new UnauthorizedException('No refresh token provided');
        }

        try {
            const payload = this.jwtService.verify(refreshToken, {
                secret: this.configService.get<string>('ACCESS_TOKEN_SECRET'),
            });

            const user = await this.prisma.user.findUnique({
                where: { id: payload.sub },
            });

            if (!user) {
                throw new UnauthorizedException('User not found');
            }
            const expiresIn = 15000;
            const expiration = Math.floor(Date.now() / 1000) + expiresIn;
            const accessToken = this.jwtService.sign({ sub: user.id }, {
                secret: this.configService.get<string>('ACCESS_TOKEN_SECRET'),
                expiresIn,
            });

            res.cookie('access_token', accessToken, {
                httpOnly: true,
                secure: process.env.NODE_ENV === 'production',
                sameSite: 'strict',
                expires: new Date(expiration * 1000),
            });

            return accessToken;
        } catch (error) {
            throw new UnauthorizedException('Invalid refresh token');
        }


    }

    issueTokens(user: User, res: Response) {
        const payload = { username: user.fullname, sub: user.id };
        const accessToken = this.jwtService.sign(payload, {
            secret: this.configService.get<string>('ACCESS_TOKEN_SECRET'),
            expiresIn: '15m',
        });
        const refreshToken = this.jwtService.sign(payload, {
            secret: this.configService.get<string>('ACCESS_TOKEN_SECRET'),
            expiresIn: '7d',
        });

        res.cookie('access_token', accessToken, {
            httpOnly: true,
            secure: process.env.NODE_ENV === 'production',
            sameSite: 'strict',
            expires: new Date(Date.now() + 15 * 60 * 1000),
        });

        res.cookie('refresh_token', refreshToken, {
            httpOnly: true,
            secure: process.env.NODE_ENV === 'production',
            sameSite: 'strict',
            expires: new Date(Date.now() + 7 * 24 * 60 * 60 * 1000),
        });

        return { user, accessToken, refreshToken };
    }


    async validateUser(loginDto: LoginDto) {
        const user = await this.prisma.user.findUnique({
            where: { email: loginDto.email },
        });
        if (!user) {
            throw new UnauthorizedException('Invalid credentials');
        }
        if (!await bcrypt.compare(loginDto.password, user.password)) {
            throw new UnauthorizedException('Invalid credentials');
        }
        return user;
    }


    async register(registerDto: RegisterDto, res: Response) {
        const existingUser = await this.prisma.user.findUnique({
            where: { email: registerDto.email },
        });
        if (existingUser) {
            throw new UnauthorizedException('Email already in use');
        }
        const hashedPassword = await bcrypt.hash(registerDto.password, 12);
        const user = await this.prisma.user.create({
            data: {
                email: registerDto.email,
                password: hashedPassword,
                fullname: registerDto.fullname,
            },
        });
        return this.issueTokens(user, res);
    }

    async login(loginDto: LoginDto, res: Response) {
        const user = await this.validateUser(loginDto);
        if (!user) {
            throw new BadRequestException('Invalid credentials');
        }
        return this.issueTokens(user, res);
    }

    async logout(res: Response) {
        res.clearCookie('access_token');
        res.clearCookie('refresh_token');
        return { message: 'Logged out successfully' };
    }
}
