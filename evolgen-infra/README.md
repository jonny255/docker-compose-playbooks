# Services to install as support for the evolgen project specifically

This could also end up being a monolithic stack

## Additional service soon to be added':'

- [ ]  PineconeDB '# Vector DB'
- [ ]  Redis
- [ ]  Playwright '# Used as web loader engine'
- [ ]  Pyodide '# Code interpreter for open webui'
- [ ]  Whisper '# STT & TTS'
- [ ]  Automatic1111 '# Image Generation Engine for open webui'
- [ ]  ComfyUI '# Image Generation Engine for open webui'

## Vibe-Coding Doesn't Work

  1. Comprehension
  2. Each time it makes an edit to the code, it often removes another section of the code that's already been worked on/completed. It's as if 'in order to implement this change or add this new feature to the code, I must first sacrifice this other section of the code that we had just worked on minutes ago.'
     - **Memories** don't work well. LLM overlooks and/or doesn't always consult with memory bank.
     - **State** seems to be promising, since the info doesn't get skewed over time like analogue data and it is a key/value type datastore. So each key/value could be a line of code?
     - **Git** Could also look into using git, or maybe a variant of it for version control/diffing, and use that to 'self-correct' itself or use as guardrails to not mess up the code. System prompt will tell LLM to not do the whole "[rest of code here]" or "[first half of the code here]", etc. Instead it could tell it to determine appropriate location for the new snippet of code to be inserted in the codebase, but it is not allowed to delete anything from the codebase. (could also make the codebase temporarily read only)
     - **Multi-Agentic** Adding on from the last section of **Git**, what if I add an intermediary agent (or 2) between the coder that wants to make changes to the codebase, and the codebase itself however it's stored and served. The job of such agents will to be re-integrate the updated code snippets in the proper location of the codebase, but it'll watch for those comments from the original coder agent saying 'insert rest of code here'
         - Code doesn't get deleted, but rather just gets commented out. A seperate deletion agent will come in and be able to delete, and it'll only be able to delete comments, not live code. This process will act as a more convenient safe measure than deleting code and then having to repull it from a previous commit.
         - Maybe add another agent, for when the code will break because some critical part was just commented it out, and this agent could assess and determine why that code was commented. maybe share its findings (that said code is critical) with the previous agent(s) to improve on identifying which code blocks could be safely altered/removed without taking 2 steps back for every 1 step forward it makes?