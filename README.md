graylog helmfile 
=================

## repositório
[roboll/helmfile](https://github.com/roboll/helmfile)

## instalação
 ```shell
 helmfile h # for help
 helmfile --debug -e <dev | stage | prod> s ync # to install
 ```

Para configurar este template você precisará de:

## helmfile.yaml
- kubeconfig com o nome do cluster que deseja instalar o graylog
- uma namespace livre, vazia ou de sua escolha para instalação dos catálogos aqui definidos


## values.yaml
### graylog
- definir a url do elasticsearch conforme o nome da namespace

obs: em
```yaml
elasticsearch:
    version: "7"
    hosts: "http://elasticsearch-client.<namespace>.svc.cluster.local:9200"

```
<namespace> é a namespace onde o graylog será instalado

- definir uma senha para o graylog
- definit se o input gelf será do tipo LB, NodePort ou ClusterIP
Este parâmetro  'input.tcp.service' é endpoint:porta onde o file bit vai enviar a colheita de logs. Caso seja um filebit em um ambiente
não local, este parâmetro deve ser de tal forma que permita uma conexão advinda da internet (NodePort, LoadBalancer). 

- definir a url do host e o host external (url de acesso ao graylog: externalUri e o ingress.host)
- fazer modificações de outros parâmetros conforme conveniência (recursos por exemplo.)

### fluentbit
- modificar os parâmetros do config para a colheita de logs atender as necessidades do cliente
    - outputs: qual é o nome do serviço de entrada o graylog gelf
    - inputs: Quais namespaces serão excluidas das colheitas de logs?

### mongodb
- modificar parâmetros à sua escolha.

### elasticsearch:
- modificar parâmetros à sua escolha

## develop | production | stage | sandbox
- habilitar ou desabilitar o que será instalado.
