import { Injectable } from '@nestjs/common';
import { disk } from '@prisma/client';
import { PrismaService } from 'prisma/prisma.service';

@Injectable()
export class AppService {
  constructor(private prisma: PrismaService) {}

  getHello(): Promise<disk[]> {
    return this.prisma.disk.findMany({
      include: {
        association: true,
      },
    });
  }
}
