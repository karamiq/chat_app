import { Field, ObjectType } from '@nestjs/graphql';
import { User } from 'src/user/types';

@ObjectType()
export class RegisterResponse {
    @Field(() => User, { nullable: true })
    user?: User;

    @Field({ nullable: true })
    accessToken?: string;

    @Field({ nullable: true })
    refreshToken?: string;

}

@ObjectType()
export class LoginResponse {
    @Field(() => User, { nullable: true })
    user?: User;

    @Field({ nullable: true })
    accessToken?: string;

    @Field({ nullable: true })
    refreshToken?: string;

}   