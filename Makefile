fmt:
	terraform fmt -recursive ./modules

fmt-all:
	terragrunt hclfmt && terraform fmt -recursive ./modules

plan-dev:
	terragrunt run-all plan --terragrunt-working-dir environments/dev/

apply-dev:
	terragrunt run-all apply --terragrunt-working-dir environments/dev/

del-cache:
	find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;