import { CanActivate, ExecutionContext, Injectable, UnauthorizedException } from '@nestjs/common';
import { Observable } from 'rxjs';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config/dist/config.service';
import { Request } from 'express';

@Injectable()
export class GraphqlAuthGuardTsGuard implements CanActivate {
  constructor(
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService
  ) { }

  async canActivate(
    context: ExecutionContext,
  ) {
    const gqlCtx = context.getArgByIndex(2);
    const request: Request = gqlCtx.req;
    const token = this.extractTokenFromHeader(request);

    if (!token) {
      return false;
    }
    try {
      const payload = this.jwtService.verify(token, {
        secret: this.configService.get<string>('ACCESS_TOKEN_SECRET'),
      });
      request['user'] = payload;
    } catch (error) {
      throw new UnauthorizedException('Invalid token');
    }
    return true;
  }

  private extractTokenFromHeader(request: any): string | null {
    return request.cookies['access_token'] || null;
  }
}
