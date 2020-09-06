<div class="advantage-item">
    <div class="advantage-icon">
        <img class="lozad" data-src="{{ $item->getImage(true) }}" alt="">
    </div>
    <p class="advantage-name">{{ $item->getTranslatedAttribute('title') }}</p>
    <p class="advantage-description">{{ $item->getTranslatedAttribute('body') }}</p>
</div>
