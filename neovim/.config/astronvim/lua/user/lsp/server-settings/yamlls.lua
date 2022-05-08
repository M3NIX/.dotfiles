return {
  	filetypes = {
		  'yaml',
		  'yaml.ansible',
		  'yaml.docker-compose',
	},
  settings = {
		yaml = {
			schemaStore = {
				enable = true,
				url = 'https://www.schemastore.org/api/json/catalog.json',
			},
			schemas = {
				['https://json.schemastore.org/github-workflow.json'] = '.github/workflows/*.{yml,yaml}',
				['https://json.schemastore.org/github-action.json'] = '.github/action.{yml,yaml}',
				['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = '/*lab-ci.{yml,yaml}',
				['https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-tasks.json'] = 'roles/tasks/**/*.{yml,yaml}',
				['https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-playbook.json'] = 'playbook{s,}/**/*.{yml,yaml}',
				['https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-inventory.json'] = 'inventory/*.{ini,yml}',
				['https://raw.githubusercontent.com/ansible-community/schemas/main/f/ansible-vars.json'] = 'vars/*.{yml,yaml}',
			},
		},
	},
}
