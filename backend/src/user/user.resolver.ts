import { Resolver, Query, Mutation, Args, Context } from '@nestjs/graphql';
import { UserService } from './user.service';
import { UseGuards } from '@nestjs/common';
import { GraphqlAuthGuardTsGuard } from 'src/auth/graphql-auth.guard';
import * as types from './types';
import { Request } from 'express';


@Resolver('User')
export class UserResolver {
    constructor(private userService: UserService) { }
    @UseGuards(GraphqlAuthGuardTsGuard)
    @Mutation(() => types.User)
    async updateProfile(
        @Args('fullname') fullname: string,
        @Args('file', { type: () => types.GraphQLUpload, nullable: true }) file: types.FileUpload,
        @Context() context: { req: Request }
    ) {
        const image = file ? await this.storeImage(file) : null;
        const userId = context.req['user'].id;
        return await this.userService.updateProfile(userId, fullname, image);

    }

    private async storeImage(file: types.FileUpload): Promise<string> {
        const { filename, createReadStream } = file;
        const stream = createReadStream();
        const path = `uploads/${Date.now()}-${filename}`;
        const writeStream = require('fs').createWriteStream(path);
        stream.pipe(writeStream);
        return new Promise((resolve, reject) => {
            writeStream.on('finish', () => resolve(`http://localhost:4000/${path}`));
            writeStream.on('error', (err) => reject(err));
        });
    }
}