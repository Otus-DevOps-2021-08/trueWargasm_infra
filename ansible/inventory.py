#!/usr/bin/env python

import sys
import json

with open("../terraform/stage/terraform.tfstate", 'r') as file:
    data = file.read()

inventory = {}
array_json = json.loads(data)

for resource in array_json["resources"]:
    inventory[json.dumps(resource["name"]).strip('\"')] = { "hosts" : [resource["instances"][0]["attributes"]["network_interface"][0]["nat_ip_address"]]}

print(json.dumps(inventory, indent=4))
