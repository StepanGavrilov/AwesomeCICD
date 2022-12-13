from __future__ import annotations

import os

from fastapi import APIRouter
from redis import Redis

users_router = APIRouter(tags=["Users router."])


@users_router.get(path="/users/")
async def root():
    redis_connection: Redis = Redis(
        host=os.getenv("REDIS_HOST"), port=os.getenv("REDIS_PORT")
    )

    redis_connection.set("test", "test")
    return "users"
