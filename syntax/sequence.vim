if exists('b:current_syntax')
  let s:current_syntax = b:current_syntax
  unlet b:current_syntax
endif

syntax region SeqParticipantLine start="\v\s*participant\s+" end="$"
            \ contains=SeqParticipantK,SeqParticipant,SeqAsK
            \ keepend display

syntax region SeqOptBlock
            \ start="\v\s*opt\s+[^\n]*$"
            \ end="\v\s*<end>"me=s-1
            \ contains=SeqOptBlock,SeqAltBlock,SeqParBlock,SeqLoopBlock,SeqRectBlock,SeqOptBlockHeader,SeqMessage
syntax region SeqAltBlock
            \ start="\v\s*alt\s+[^\n]*$"
            \ end="\v\s*<end>"me=s-1
            \ contains=SeqOptBlock,SeqAltBlock,SeqParBlock,SeqLoopBlock,SeqRectBlock,SeqAltBlockHeader,SeqMessage,SeqElseK
syntax region SeqParBlock
            \ start="\v\s*par\s+[^\n]*$"
            \ end="\v\s*<end>"me=s-1
            \ contains=SeqOptBlock,SeqAltBlock,SeqParBlock,SeqLoopBlock,SeqRectBlock,SeqParBlockHeader,SeqMessage,SeqAndK
syntax region SeqLoopBlock
            \ start="\v\s*loop\s+[^\n]*$"
            \ end="\v\s*<end>"me=s-1
            \ contains=SeqOptBlock,SeqAltBlock,SeqParBlock,SeqLoopBlock,SeqRectBlock,SeqLoopBlockHeader,SeqMessage
syntax region SeqRectBlock
            \ start="\v\s*rect\s+[^\n]*$"
            \ end="\v\s*<end>"me=s-1
            \ contains=SeqOptBlock,SeqAltBlock,SeqParBlock,SeqLoopBlock,SeqRectBlock,SeqRectBlockHeader,SeqMessage

syntax match SeqOptBlockHeader  /\v\s*opt\s+[^\n]*/  contained contains=SeqOptK,SeqDescription
syntax match SeqAltBlockHeader  /\v\s*alt\s+[^\n]*/  contained contains=SeqAltK,SeqDescription
syntax match SeqParBlockHeader  /\v\s*par\s+[^\n]*/  contained contains=SeqParK,SeqDescription
syntax match SeqLoopBlockHeader /\v\s*loop\s+[^\n]*/ contained contains=SeqLoopK,SeqDescription
syntax match SeqRectBlockHeader /\v\s*rect\s+[^\n]*/ contained contains=SeqRectK,SeqColorValue

syntax region SeqComment start="%%" end="$" oneline
syntax match SeqColorValue /\vrgba?\([0-9]{1,3}, [0-9]{1,3}, [0-9]{1,3}(, [0-9]{1,3})?\)/ contained contains=SeqColorNumber,SeqColorSep
syntax match SeqColorNumber /\v[0-9]+/ contained
syntax match SeqColorSep /\v[\(\),]/ contained

syntax match SeqMessage /[^\n]*:[^\n]*$/
           \ contains=SeqNote,SeqNoteK,SeqParticipant,SeqParticipantK,SeqArrow,SeqSeparator,SeqDescription
           \ display

syntax match SeqDescription /\s*[^\n]*/                  contained
syntax match SeqParticipant /\v\s*(\w+\s*){-1,}/         contained
syntax match SeqArrow       /\v\-\-?(\>{1,2}|x|\))[-+]?/ contained
syntax match SeqSeparator   /:/                          contained nextgroup=SeqDescription

syntax match SeqDiagramStartK /sequenceDiagram/
syntax match SeqParticipantK  /\v\s*<participant>/ contained
syntax match SeqAsK           /\v\s*<as>/
syntax match SeqNoteK         /\v\s*<Note (right of|left of|over)>/
syntax match SeqOptK          /\v\s*<opt>/  contained nextgroup=SeqDescription
syntax match SeqParK          /\v\s*<par>/  contained nextgroup=SeqDescription
syntax match SeqAltK          /\v\s*<alt>/  contained nextgroup=SeqDescription
syntax match SeqLoopK         /\v\s*<loop>/ contained nextgroup=SeqDescription
syntax match SeqRectK         /\v\s*<rect>/ contained nextgroup=SeqColorValue
syntax match SeqElseK         /\v\s*<else>/ contained
syntax match SeqAndK          /\v\s*<and>/  contained
syntax match SeqEndK          /\v\s*<end>/

highlight link SeqDiagramStartK Keyword
highlight link SeqParticipantK  Keyword
highlight link SeqAsK           Keyword
highlight link SeqNoteK         Keyword
highlight link SeqElseK         Keyword
highlight link SeqEndK          Keyword
highlight link SeqParK          Keyword
highlight link SeqLoopK         Keyword
highlight link SeqRectK         Keyword
highlight link SeqOptK          Keyword
highlight link SeqAltK          Keyword

highlight link SeqComment Comment

highlight link SeqDescription Label
highlight link SeqParticipant Identifier
highlight link SeqArrow       SpecialChar
highlight link SeqSeparator   Delimiter
highlight link SeqColorSep    SeqSeparator
highlight link SeqColorNumber Number

if exists('s:current_syntax')
  let b:current_syntax = s:current_syntax
else
  let b:current_syntax = 'sequence'
endif
