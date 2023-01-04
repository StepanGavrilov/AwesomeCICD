import os
import json
import datetime

from pathlib import Path
from typing import Dict

from github import Github
from github.Branch import Branch

GITHUB_STATS_FILE = "/home/machine_1_user/github.json"
g = Github(login_or_token="YOUR TOKEN HERE")
master_branch: Branch = g.get_repo("StepanGavrilov/AwesomeCICD").get_branch("master")

if Path(GITHUB_STATS_FILE).exists():

    with open(GITHUB_STATS_FILE, "r") as f:
        data: Dict[str, str] = json.loads(f.read())
        etag = data.get("etag")

    print(f"old: {etag}")
    print(f"new: {master_branch.etag:}")

    if etag != master_branch.etag:
        os.system(
            f"docker-compose -f /home/machine_1_user/AwesomeCICD/docker-compose.prod.yml down"
        )
        print("downed")
        deleted = os.system("rm -rf /home/machine_1_user/AwesomeCICD/")
        print(f"deleted: {deleted.real}")
        os.system(
            f'git clone {g.get_repo("StepanGavrilov/AwesomeCICD").clone_url} /home/machine_1_user/AwesomeCICD'
        )
        print("cloned")
        os.chdir("/home/machine_1_user/AwesomeCICD/")
        print("changed dir")
        os.system(f"/home/machine_1_user/AwesomeCICD/entrypoint.sh Prod")
        with open(GITHUB_STATS_FILE, "w+") as f:
            f.write(json.dumps({"etag": master_branch.etag}))
        print("etag updated!")
    else:
        print(f"no changes: {str(datetime.datetime.now())}")
else:
    with open(GITHUB_STATS_FILE, "w") as f:
        f.write(json.dumps({"etag": master_branch.etag}))
