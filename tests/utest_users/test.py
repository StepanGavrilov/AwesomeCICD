from unittest import TestCase

from fastapi.testclient import TestClient

from src.asgi import create_app


class UsersTest(TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.client = TestClient(app=create_app())  # type: ignore

    def test_root(self):
        response = self.client.get(url="/users/")
        self.assertEqual(
            first=response.status_code,
            second=200,
            msg=f"response code: {response.status_code}, must be: 200 OK",
        )
