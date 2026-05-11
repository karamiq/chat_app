import { Args, Context, Mutation, Query, Resolver } from '@nestjs/graphql';
import { AuthService } from './auth.service';
import { LoginDto, RegisterDto } from './dto';
import { LoginResponse, RegisterResponse } from './types';
import { Response, Request } from 'express';
import { BadRequestException } from '@nestjs/common';
@Resolver()
export class AuthResolver {

    constructor(
        private readonly authService: AuthService,
    ) { }

    @Mutation(() => RegisterResponse)
    async register(@Args('input') input: RegisterDto, @Context() context: { res: Response }) {
        if (input.password !== input.confirmPassword) {
            throw new Error('Passwords do not match');
        }
        return await this.authService.register(input, context.res);
    }

    @Mutation(() => LoginResponse)
    async login(@Args('input') input: LoginDto, @Context() context: { res: Response }) {
        return await this.authService.login(input, context.res);
    }
    @Mutation(() => String)
    async refreshToken(@Context() context: { req: Request, res: Response }) {
        try {
            return await this.authService.refreshToken(context.req, context.res);
        } catch (error) {
            throw new BadRequestException(error instanceof Error ? error.message : 'Unknown error');
        }
    }
    @Query(() => String)
    meow() {
        return 'meow meow';
    }


}
