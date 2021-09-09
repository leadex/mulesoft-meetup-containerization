# MuleSoft meet-up: Containerizing MuleSoft applications for Hybrid deployment

A public repository to store demonstration assets for the MuleSoft meetup about containerization.

## Repository contents

* `/ansible/` – build and deployment Ansible scripts.
* `/api/` – API implementation applications based on [MuleSoft Accelerator for Financial Services](https://anypoint.mulesoft.com/exchange/org.mule.examples/mulesoft-accelerator-for-financial-services/).
* `/misc/` – Maven settings.xml to build MuleSoft projects and Postman collection to test API invocation.

## Requirements

* Linux, macOS or any BSD operating system to run Ansible playbooks.
* Docker 1.24 or higher (Docker Desktop for macOS).
* The user which is to run Ansible playbooks must be able to run docker commands.
* Postman to test deployed API implementations.

## Configuration

Before running Ansible playbooks, the following configuration steps must be performed:
1. Follow [Ansible installation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) guide. 
2. Run `ansible-galaxy install -r requirements.yml` to install the necessary collections.
3. Use your existing Anypoint Platform account or [create a trial one](https://anypoint.mulesoft.com/login/signup).
4. Download [Mule ESB Enterprise](https://www.mulesoft.com/lp/dl/mule-esb-enterprise) standalone distribution.
5. Obtain Anypoint [organization credentials](https://docs.mulesoft.com/api-manager/2.x/org-credentials-config-mule4#obtaining-organization-credentials): `client_id` and `client_secret`.
6. Create a new sandbox environment in Anypoint with the name `dev `.

## Deploying API applications into a local Docker Swarm cluster

0. Go to the `ansible` folder.
1. Run the build Ansible playbook with the following command:
    ```shell
    ansible-playbook build.yaml -i inventory/local.yaml -e "{'mule_runtime_package_url':'file://...','mule_anypoint_client_id':'...','mule_anypoint_client_secret':'...'}"
    ```
    where:
    * `mule_runtime_package_url` – URL to the Mule Enterprise Runtime distribution, for example `file:///Users/admin/Downloads/mule-ee-distribution-standalone-4.3.0-20210119.zip`;
    * `mule_anypoint_client_id` – Anypoint organization `client_id`;
    * `mule_anypoint_client_secret` – Anypoint organization `client_secret`.
3. Run the deploy Ansible playbook with the following command:
    ```shell
    ansible-playbook deploy.yaml -i inventory/local.yaml -e "{'mule_anypoint_org':'...','mule_anypoint_username':'...','mule_anypoint_password':'...'}"
    ```
    where:
    * `mule_anypoint_org` – name of the Anypoint organization;
    * `mule_anypoint_username` – name of the administrator user;
    * `mule_anypoint_password` – password of the administrator user;
4. To remove the deployed docker stacks, run the following Ansible playbook:
    ```shell
    ansible-playbook clean.yaml -i inventory/local.yaml
    ```
## Testing API applications with Postman

1. Import `/misc/postman-environment.json` into your Postman workspace. This enviroment assumes that the Docker Swarm cluster is running on `localhost`.
2. Import `/misc/postman-collection.json` into your Postman workspace. This collection has requests to test different APIs, including process and system.

## License
[MIT](https://choosealicense.com/licenses/mit/)