import { Field, ObjectType } from '@nestjs/graphql';
import { GraphQLScalarType } from 'graphql/type/definition';


@ObjectType()
export class User {
    @Field({ nullable: true })
    id?: number;

    @Field()
    fullname!: string;

    @Field()
    email?: string;

    @Field({ nullable: true })
    avatar?: string;

    @Field({ nullable: true })
    password?: string;

    @Field({ nullable: true })
    createdAt?: Date;

    @Field({ nullable: true })
    updatedAt?: Date;

}

export const GraphQLUpload = new GraphQLScalarType({
    name: 'Upload',
});

export type FileUpload = {
    filename: string;
    mimetype: string;
    encoding: string;
    createReadStream: () => NodeJS.ReadableStream;
};
