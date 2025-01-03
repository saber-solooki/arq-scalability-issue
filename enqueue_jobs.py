import asyncio
from arq import create_pool
from arq.connections import RedisSettings


async def enqueue_jobs():
    redis = await create_pool(RedisSettings(host="localhost", port=6379))
    for i in range(10):
        await redis.enqueue_job("say_hello", "World")


if __name__ == '__main__':
    asyncio.run(enqueue_jobs())