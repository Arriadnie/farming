<footer>
    <div class="footer-content">
        <div class="footer-logo">
            <img class="lozad" data-src="{{ asset('/image/logo.png') }}" alt="">
        </div>
    </div>

   <div class="footer-content">

       <div class="footer-left">
           <div class="footer-contacts">
               <p class="footer-heading">@lang('main.contacts'):</p>
               <div class="footer-contact-list">
                   @foreach(explode(',', setting('contacts.email')) as $email)
                       <a type="mail" href="mailto:{{ $email }}">
                           <img class="lozad" data-src="{{ asset('/image/mail.svg') }}" alt="">
                           <span>{{ $email }}</span>
                       </a>
                   @endforeach
                   @foreach(explode(',', setting('contacts.mobile-phone')) as $phone)
                       <a type="phone" href="tel^{{ $phone }}">
                           <img class="lozad" data-src="{{ asset('/image/phone.svg') }}" alt="">
                           <span>{{ $phone }}</span>
                       </a>
                   @endforeach

               </div>
           </div>
{{--           @if(count(App\Models\SocialNetwork::all() ) > 0)--}}
{{--           <div class="footer-contacts">--}}

{{--               <p class="footer-heading">@lang('main.socials'):</p>--}}
{{--               <div class="footer-socials-list">--}}
{{--                   @foreach(App\Models\SocialNetwork::all() as $network)--}}
{{--                       <a href="{{ $network->link }}" target="_blank">--}}
{{--                           <img src="{{ $network->getImage(true) }}" alt="">--}}
{{--                       </a>--}}
{{--                   @endforeach--}}
{{--               </div>--}}
{{--           </div>--}}
{{--           @endif--}}


       </div>

       <div class="footer-right">
           {{ menu('footer-navigation', 'menus/footer-navigation') }}
       </div>
   </div>
    <div class="copyright">
        <p>{{ date('Y') }} CrimFarming ©</p>
        <p>created by <a target="_blank" href="http://www.zirael.com.ua/">Zirael</a></p>
    </div>


</footer>
