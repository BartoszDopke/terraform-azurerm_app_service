## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ad\_map | n/a | `map(any)` | `{}` | no |
| allowed\_origins | n/a | `list(string)` | `[]` | no |
| always\_on | n/a | `bool` | `false` | no |
| app\_command\_line | n/a | `string` | `null` | no |
| app\_service\_plan\_id | n/a | `string` | n/a | yes |
| app\_settings | n/a | `map(string)` | `null` | no |
| app\_type | Enable or disable MSI | `string` | `null` | no |
| auth\_default\_provider | n/a | `string` | `null` | no |
| auth\_enabled | n/a | `string` | n/a | yes |
| auth\_issuer | n/a | `string` | `null` | no |
| auth\_runtime\_version | n/a | `string` | `null` | no |
| auth\_token\_store\_enabled | n/a | `string` | `false` | no |
| auth\_unauthenticated\_client\_action | n/a | `string` | `null` | no |
| client\_affinity\_enabled | n/a | `bool` | `null` | no |
| client\_cert\_enabled | n/a | `bool` | `false` | no |
| default\_documents | n/a | `list(string)` | `[]` | no |
| dotnet\_framework\_version | n/a | `string` | `"v4.0"` | no |
| enable\_diagnostics | n/a | `bool` | `false` | no |
| enabled | n/a | `bool` | `null` | no |
| ftps\_state | n/a | `string` | `null` | no |
| https\_only | n/a | `bool` | `null` | no |
| ip\_list\_path | IP list path for IP restrictions | `string` | `null` | no |
| linux\_fx\_version | n/a | `string` | `null` | no |
| location | n/a | `string` | n/a | yes |
| log\_analytics\_workspace\_id | Workspace ID | `string` | `null` | no |
| managed\_pipeline\_mode | n/a | `string` | `"Integrated"` | no |
| min\_tls\_version | n/a | `string` | `"1.2"` | no |
| name | n/a | `string` | n/a | yes |
| php\_version | n/a | `string` | `null` | no |
| remote\_debugging\_enabled | n/a | `bool` | `false` | no |
| remote\_debugging\_version | n/a | `string` | `null` | no |
| resource\_group\_name | n/a | `string` | n/a | yes |
| scm\_type | n/a | `string` | `null` | no |
| support\_credentials | n/a | `bool` | `null` | no |
| tags | tags | `map(any)` | `"Map of tags"` | no |
| token\_refresh\_extension\_hours | n/a | `number` | `72` | no |
| use\_32\_bit\_worker\_process | n/a | `bool` | `null` | no |
| websockets\_enabled | n/a | `bool` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| default\_site\_hostname | n/a |
| id | n/a |
| name | n/a |
| principal\_id | n/a |


## Templates/example_list.json 

It's an example file to use with IP restrictions.

