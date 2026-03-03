## Robot Framework Test Automation Project

Este é um projeto de testes automatizados com Robot Framework configurado para CI/CD com GitHub Actions.

### Estrutura
- **tests/**: Testes Robot Framework (.robot)
- **resources/**: Keywords e variáveis reutilizáveis
- **.github/workflows/**: Configuração de CI/CD

### Comandos principais
- Executar testes: `robot --outputdir results tests/`
- Executar headless: `robot --variable BROWSER:headlessChrome --outputdir results tests/`

### CI/CD
Configurado no GitHub Actions. Testes executam automaticamente em:
- Push para main/develop
- Pull requests
- Agendamento diário (8:00 AM)
