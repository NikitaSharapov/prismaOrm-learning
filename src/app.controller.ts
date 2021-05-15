import { Controller, Get } from '@nestjs/common';
import { disk } from '@prisma/client';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): Promise<disk[]> {
    return this.appService.getHello();
  }
}
