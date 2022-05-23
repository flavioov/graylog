# Graylog

Graylog and spotinst virtual nodegroup

# O Que é provisionado? 

São provisionados um virtual node group na spotinst com 2 máquinas.

## dependências
- 1 cluster kubernetes
- 1 cluster kubernetes na spotinst
- credenciais de acesso à spotinst e ao cluster kubernetes

# Environment Variables
| Env     | Provider | Value |
| :----------- | :------: | :-----------: |
| `AWS_ACCESS_KEY_ID` | AWS | - |
| `AWS_SECRET_ACCESS_KEY` | AWS | - |
| `AWS_REGION`  | AWS | - |
| `SPOTINST_TOKEN`| SPOTINST | - |
| `SPOTINST_ACCOUNT`| SPOTINST | - |
| `TF_INPUT`| LOCAL | 0 |
| `TF_LOG` | LOCAL | trace |
| `TF_LOG_PATH` | LOCAL | terraform.log |

export SPOTINST_TOKEN=5f0d861d10307aba19573c6127c8498cfc80f33d1e6ae14a75a8ccb2b6987b5c
export SPOTINST_ACCOUNT=act-d9550dda
export TF_INPUT=0
export TF_LOG_PATH=./terraform.log
export TF_INPUT=trace



# Graylog Configuration

## inputs

## users

## streams

## indexes

## dashboards