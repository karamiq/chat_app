import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class UserService {
    constructor(private readonly prisma: PrismaService) { }
    async updateProfile(userId: number, fullname: string, avatarUrl?: string | null) {
        // if no avatarUrl is provided, only update the fullname
        if (!avatarUrl) {
            return await this.prisma.user.update({
                where: { id: userId },
                data: { fullname },
            });
        }
        // if avatarUrl is provided, update both fullname and avatarUrl while authenticating the new avatarUrl
        if (avatarUrl && !/^https?:\/\/.+\.(jpg|jpeg|png|gif|bmp|webp)$/.test(avatarUrl)) {
            throw new BadRequestException('Invalid avatar URL. Must be a valid image URL ending with .jpg, .jpeg, .png, .gif, .bmp, or .webp');
        }
        return await this.prisma.user.update({
            where: { id: userId },
            data: { fullname, avatar: avatarUrl },
        });
    }

    async getUserById(userId: number) {
        const user = await this.prisma.user.findUniqueOrThrow({
            where: { id: userId }
        });
        if (!user) {
            throw new BadRequestException('User not found');
        }
        return user;
    }


}
