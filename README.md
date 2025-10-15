# CoreEngine

[![CoreEngine](https://img.shields.io/badge/CoreEngine-v1.0.0-478cbf?style=for-the-badge)](https://www.cafegame.dev/pt-BR/cafeengine)
[![License](https://img.shields.io/badge/License-MIT-f1c40f?style=for-the-badge)](https://opensource.org/licenses/MIT)

O **CoreEngine** é o núcleo da suíte CafeEngine, fornecendo a infraestrutura fundamental e as ferramentas básicas para todos os outros plugins. Ele estabelece os padrões de integração e comunicação entre os módulos, garantindo uma experiência de desenvolvimento coesa e eficiente no Godot 4.x.

## Principais Funcionalidades

*   **Infraestrutura Compartilhada:** Oferece classes base e utilitários que são estendidos e utilizados por todos os plugins da CafeEngine.
*   **Gerenciamento de Plugins:** Facilita o registro e a coordenação de outros plugins da suíte, garantindo que funcionem harmoniosamente.
*   **CorePanel (Host de SidePanels):** Atua como o host unificado para todos os SidePanels dos plugins da CafeEngine, centralizando as interfaces de configuração rápida em um único local no editor.
*   **CoreTopPanel (Editor de Resources):** Inclui um editor de alto nível dedicado à visualização e edição de arquivos `.tres` como texto/código, proporcionando uma ferramenta universal para gerenciar Resources.

## Documentação

A documentação completa, com guias detalhados, tutoriais e a referência da API, pode ser encontrada no nosso site oficial:

[https://www.cafegame.dev/cafeengine/coreengine](https://www.cafegame.dev/cafeengine/coreengine)

## Instalação

1.  **AssetLib (Recomendado):**
    *   Procure por "CoreEngine" na Godot Asset Library e instale o plugin.
2.  **Manual (GitHub):**
    *   Baixe o repositório.
    *   Copie a pasta `addons/core_engine` para a pasta `addons/` do seu projeto.

Após a instalação, vá em `Project -> Project Settings -> Plugins` e ative o plugin **CoreEngine**.

## Contribuição

Este é um projeto open-source. Contribuições são bem-vindas! Por favor, leia nosso [guia de contribuição](../../CONTRIBUTING.md) para saber como reportar bugs, sugerir funcionalidades e submeter pull requests.

## Licença

Este projeto é distribuído sob a Licença MIT. Veja o arquivo [LICENSE](../../LICENSE) para mais detalhes.