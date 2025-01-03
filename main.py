from arq import Worker
from arq.connections import RedisSettings


async def say_hello(ctx, name: str):
    print(f"Hello, {name}!")
    return f"Greeted {name}"


class WorkerSettings:
    functions = [say_hello]
    redis_settings = RedisSettings(host='redis', port=6379)

