Template for python-based projects with gitlab ci.

* pre-commit
* gitlab ci
* badges
* integration tests

Tests
==

```
pytest tests/test.py -vv
```

Dependencies
==

```
poetry export -f requirements.txt --output requirements.txt
```

How commit ?
==

```
git add .pre-commit-config.yaml
```

```
pre-commit run
```
