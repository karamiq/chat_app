import { Module } from '@nestjs/common';
import { AuthModule } from 'src/auth/auth.module';
import { PrismaModule } from 'src/prisma.module';
import { UserService } from './user.service';
import { UserResolver } from './user.resolver';

@Module({
  imports: [PrismaModule, AuthModule],
  providers: [UserService, UserResolver]
})
export class UserModule { }
