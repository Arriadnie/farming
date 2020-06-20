<div style="background: url('{{ $infoblock->getImage(true)   }}')">

    <h2>{{ $infoblock->getTranslatedAttribute("title") }}</h2>
    <p class="subtitle">{{ $infoblock->getTranslatedAttribute("sub_title") }}</p>
    <a href="{{ $infoblock->button_link }}" class="main-btn">{{ $infoblock->getTranslatedAttribute("button_title") }}</a>

</div>
