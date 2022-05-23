fmt:
	terraform fmt -recursive ./modules

fmt-all:
	terragrunt hclfmt && terraform fmt -recursive ./modules

plan-dev:
	terragrunt run-all plan --terragrunt-working-dir environments/dev/