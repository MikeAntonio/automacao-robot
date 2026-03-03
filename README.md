# Robot Framework Test Automation

Projeto de testes automatizados usando Robot Framework para validar acesso e funcionalidades de sites.

## Estrutura do Projeto

```
.
├── tests/                    # Diretório com testes Robot Framework
│   └── website_test.robot    # Testes de acesso ao site
├── resources/                # Arquivos de recursos (keywords e variáveis)
│   ├── keywords.robot        # Keywords customizadas reutilizáveis
│   └── variables.robot       # Variáveis globais
├── .github/
│   └── workflows/
│       └── robot-tests.yml   # Workflow CI/CD do GitHub Actions
├── requirements.txt          # Dependências Python
└── README.md                 # Este arquivo
```

## Pré-requisitos

- Python 3.9+
- Chrome/Chromium instalado

## Instalação

1. Clone o repositório
2. Instale as dependências:
   ```bash
   pip install -r requirements.txt
   ```

## Executando os Testes Localmente

### Modo gráfico (com navegador visível):
```bash
robot --outputdir results tests/
```

### Modo headless (sem interface gráfica):
```bash
robot --variable BROWSER:headlessChrome --outputdir results tests/
```

### Executar teste específico:
```bash
robot --outputdir results --test "Test Website Access Success" tests/
```

## CI/CD - GitHub Actions

Os testes rodam automaticamente através do GitHub Actions em:
- **Push** para branches `main` e `develop`
- **Pull Requests** para `main` e `develop`
- **Agendado** diariamente às 8:00 AM

### Workflow automático

O workflow está configurado em `.github/workflows/robot-tests.yml` e:
1. Faz setup do ambiente Python
2. Instala dependências
3. Instala Chrome
4. Executa os testes
5. Faz upload dos resultados como artifact
6. Publica relatório de testes

## Visualizando Resultados

Após executar os testes, verifique:
- `results/report.html` - Relatório visual detalhado
- `results/log.html` - Log completo de execução
- `results/report.xml` - Relatório em XML (usado pelo CI)

## Adicionando Novos Testes

1. Crie um novo arquivo `.robot` em `tests/`
2. Importe as resources necessárias:
   ```robot
   *** Settings ***
   Library    SeleniumLibrary
   Resource    ../resources/keywords.robot
   Resource    ../resources/variables.robot
   ```
3. Defina seus testes em `*** Test Cases ***`

## Exemplo de Novo Teste

```robot
*** Test Cases ***
Test My New Feature
    [Documentation]    Descrição do teste
    Open Browser    https://example.com    Chrome
    Page Should Contain    Expected Text
    Close Browser
```

## Troubleshooting

- **WebDriver não encontrado**: Execute `python -m webdriver_manager chrome`
- **Timeout de página**: Aumente `${TIMEOUT}` em `resources/variables.robot`
- **Testes falhando no CI**: Verifique logs no GitHub Actions > Actions > Robot Framework Tests

## Referências

- [Robot Framework Documentation](https://robotframework.org/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
