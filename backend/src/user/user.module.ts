import { Module } from '@nestjs/common';
import { AuthModule } from 'src/auth/auth.module';
import { UserService } from './user.service';
import { UserResolver } from './user.resolver';

@Module({
  imports: [AuthModule],
  providers: [UserService, UserResolver]
})
export class UserModule { }
