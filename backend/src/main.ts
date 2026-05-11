import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import cookieParser from 'cookie-parser';
import graphqlUploadExpress from 'graphql-upload/graphqlUploadExpress.mjs';
import { BadRequestException, ValidationPipe } from '@nestjs/common';
import { error } from 'console';
async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({
    origin: 'http://localhost:5173',
    credentials: true,

    allowheaders: ['Content-Type', 'Authorization',
      'Accept', 'Origin', 'X-Requested-With'
      , 'apollo-require-preflight'
    ],
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  });
  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
      forbidNonWhitelisted: true,
      transform: true,
      exceptionFactory: (errors) => {
        const formattedErrors = errors.reduce((acc, err) => {
          acc[err.property] = Object.values(err.constraints || {}).join(', ');
          return acc;
        });

        return new BadRequestException(formattedErrors)
      }
    })
  );
  app.use(cookieParser());
  app.use(graphqlUploadExpress({ maxFileSize: 10000000, maxFiles: 10 }));
  await app.listen(process.env.PORT ?? 3000);

}
bootstrap();