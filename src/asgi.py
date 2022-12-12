from fastapi import FastAPI

from src.users.router import users_router


def create_app() -> FastAPI:
    api = FastAPI(title="Awesome API")
    api.include_router(users_router)
    return api


app = create_app()
