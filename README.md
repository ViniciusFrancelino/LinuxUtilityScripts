# Linux Utility Scripts

Coleção de scripts em **Bash** voltados para automação, manutenção de sistemas Linux e testes de conectividade de rede.

Este repositório reúne pequenas ferramentas criadas para facilitar tarefas administrativas recorrentes, reduzir trabalho manual e padronizar algumas rotinas de infraestrutura.

Os scripts foram desenvolvidos para uso em ambientes Linux e podem ser adaptados conforme a necessidade de cada ambiente.

---

## Objetivo

Este repositório tem como objetivo centralizar scripts úteis para:

- Automação de tarefas administrativas
- Manutenção básica de sistemas Linux
- Testes de conectividade e acesso a serviços
- Automação de rotinas de rede
- Apoio em diagnósticos de infraestrutura

A ideia é manter soluções simples, diretas e facilmente modificáveis.

---

## Requisitos

Dependendo do script utilizado, alguns softwares podem ser necessários:

- Linux
- Bash
- OpenVPN
- Apache HTTP Server
- permissões de `sudo`/`root` para algumas tarefas administrativas

---

## Instalação

Clone o repositório:

```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
```
Acesse a pasta:
```
cd seu-repositorio
```
Dê permissão de execução aos scripts:
```
chmod +x *.sh
```
Uso

Cada script pode ser executado diretamente pelo terminal:
```
./nome-do-script.sh
```
Alguns scripts podem exigir privilégios administrativos:
```
sudo ./nome-do-script.sh
```
Também é possível agendar execuções utilizando cron para tarefas recorrentes.

Edite o crontab:
```
crontab -e
```
Exemplo de agendamento:
```
0 */6 * * * /caminho/script/drop-cache.sh
```
Isso executará o script a cada 6 horas.

---
Antes de executar qualquer script em produção:

- Revise o código
- Valide caminhos e permissões
- Adapte variáveis para seu ambiente
- Teste primeiro em ambiente de homologação

Alguns scripts podem impactar recursos do sistema ou rede.

---

## Estrutura do Projeto

```
linuxUtilityScripts/
│
├── maintenance/
│   └── drop-cache.sh
│
├── network/
│   └── openvpn-work-connect.sh
│
├── proxy-tests/
│   └── apache-access-test.sh
│
└── README.md
```

---

## Contribuição

Contribuições são bem-vindas.

Caso queira contribuir:

Faça um fork do repositório

Crie uma branch para sua alteração:

```
git checkout -b minha-melhoria
```

Faça commit das alterações:

```
git commit -m "Adiciona novo script de automação"
```

Envie para o seu fork:

```
git push origin minha-melhoria
```

Abra um Pull Request
