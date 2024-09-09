# 🚀 DevHatt Infra - Deploy da Infraestrutura na AWS com Terraform

Este repositório contém o código para provisionamento da infraestrutura do projeto **DevHatt** na AWS, utilizando o Terraform. O projeto está organizado em módulos para facilitar a manutenção e a escalabilidade, mas ainda há melhorias a serem feitas para permitir ainda mais a modularização (como usar o [count](https://developer.hashicorp.com/terraform/language/meta-arguments/count)).

O público alvo deste repositório são os mantenedores da infra do projeto DevHatt! Tome cuidado, pois podem haver custos de infra na AWS, saiba o que você está fazendo 🤓.

## 💸 Instâncias Spot por Padrão

Por questões de custo, este projeto utiliza **instâncias Spot** da AWS para provisionamento de máquinas EC2 por padrão. As instâncias Spot permitem economizar em comparação com instâncias sob demanda, mas podem ser interrompidas pela AWS a qualquer momento.

Se você preferir usar instâncias sob demanda, é necessário ajustar o código no módulo EC2.

Para mais informações sobre instâncias Spot, consulte a [documentação oficial da AWS](https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/using-spot-instances.html).

## 📁 Estrutura do Repositório

```plain
terraform/
└── aws/
    ├── devhatt-infra/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── terraform.tfvars    # Arquivo de variáveis (não versionar!!!)
    └── modules/
        ├── network/            # Módulo de rede (VPC, Subnets, etc.)
        └── ec2/                # Módulo de instância EC2.

```

## ⚙️ Configuração

Antes de iniciar o deploy, é necessário configurar o arquivo `terraform.tfvars`, que contém as variáveis específicas para o ambiente. **Este arquivo não deve ser versionado no Git!!**.

### 📄 Exemplo de `terraform.tfvars`

```hcl
# Região AWS
region = "sa-east-1"

# Nome do projeto
project_name = "devhatt"

# Blocos CIDR para a VPC e Subnet
vpc_cidr_block = "10.0.0.0/16"
public_subnet_cidr_block = "10.0.1.0/24"

# Nome do Key Pair para acessar a instância EC2. (Precisa estar criada previamente. TODO.)
key_pair_name = "minha-chave-aws"

# Nome da instância EC2
instance_name = "prod-01.devhatt.dev"

# Credenciais da AWS (use com cuidado!!!)
aws_access_key = "INSIRA_SUA_ACCESS_KEY"
aws_secret_key = "INSIRA_SUA_SECRET_KEY"

```

⚠️ **Atenção**: As credenciais da AWS (`aws_access_key` e `aws_secret_key`) são extremamente sensíveis! Nunca compartilhe ou versione esse arquivo. Use práticas seguras, como variáveis de ambiente ou serviços de gerenciamento de credenciais.

## 🛠️ Passos para o Deploy

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/devhatt/infra
   cd terraform/aws/devhatt-infra
   ```

2. **Configure o arquivo `terraform.tfvars`** com os valores adequados ao seu ambiente (como mostrado no exemplo acima).

3. **Inicialize o Terraform**:

   ```bash
   terraform init
   ```

   📦 Isso fará o download dos provedores e configurará o ambiente do Terraform.

4. **Revise o plano de execução**:

   ```bash
   terraform plan
   ```

   🔍 Este comando irá mostrar o que será criado/modificado na sua infraestrutura.

5. **Aplique o plano de execução**:

   ```bash
   terraform apply
   ```

   ✅ Confirme a execução para que o Terraform provisione os recursos na AWS.

6. **Destrua a infraestrutura (se necessário)**:

   ```bash
   terraform destroy
   ```

   ❗ Use este comando para remover todos os recursos criados pelo Terraform.

## 📊 Armazenando o `terraform.tfstate` em um Backend Remoto

É **essencial** armazenar o arquivo de estado do Terraform (`terraform.tfstate`) em um backend remoto seguro. O arquivo de estado mantém o mapeamento entre os recursos gerenciados pelo Terraform e a infraestrutura real na AWS. Utilizar um backend remoto permite que múltiplos colaboradores e processos CI/CD compartilhem e acessem o mesmo estado, garantindo que todos estejam trabalhando com a mesma visão da infraestrutura.

[Saiba mais](https://spacelift.io/blog/terraform-state).

## 📝 Considerações Finais

- O arquivo `terraform.tfvars` contém informações sensíveis (como credenciais da AWS). **Não versione esse arquivo no Git**. 
- **Nunca** compartilhe suas credenciais da AWS em repositórios públicos ou com terceiros.
- Utilize boas práticas de segurança, como armazenamento seguro de credenciais (por exemplo, Hashicorp Vault).

🛡️ **Segurança em primeiro lugar!**

---
