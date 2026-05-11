import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { AuthResolver } from './auth.resolver';
import { AuthService } from './auth.service';
import { GraphqlAuthGuardTsGuard } from './graphql-auth.guard';

@Module({
  imports: [
    JwtModule.registerAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => ({
        secret: configService.get<string>('ACCESS_TOKEN_SECRET'),
      }),
    }),
  ],
  providers: [AuthResolver, AuthService, GraphqlAuthGuardTsGuard],
  exports: [AuthService, GraphqlAuthGuardTsGuard, JwtModule],
})
export class AuthModule { }
