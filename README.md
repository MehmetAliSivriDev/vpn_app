# VPN Uygulaması


## Görüntüler
**GIF ve PNG dosyaları mevcuttur.**

<table>
  <tr>
    <td><img src="app_images/app.gif" width="250" /></td>
    <td><img src="app_images/theme_change.gif" width="250" /></td>
  </tr>
  <tr>
    <td><img src="app_images/1.png" width="250" /></td>
    <td><img src="app_images/2.png" width="250" /></td>
    <td><img src="app_images/3.png" width="250" /></td>
  </tr>
  <tr>
    <td><img src="app_images/4.png" width="250" /></td>
    <td><img src="app_images/5.png" width="250" /></td>
  </tr>
</table>

---

## Ön Açıklama
- Proje geliştirilirken MVVM mimarisi ve GetX state management yöntemi tercih edildi.

## Kullanılan Paketler ve Nedenleri

- **http:** Sunucu ile API istekleri yapmak için kullanılır lakin bu projede mock data kullanıldığı için servis fonksiyonunun nasıl olabileceğini göstermek için kullanıldı.  
- **kartal:** Mediaquery ve text temaları için kolay erişimi sağlayan bir paket geliştirme sürecinde kolaylık için kullanıldı.  
- **get:** GetX state management yöntemi için kullanıldı.  
- **flutter_svg:** SVG ikonlar ve grafikler kullanmak için. kullanıldı.  
- **flutter_animate & animations:** Animasyonlar için kullanıldı.  
- **lottie:** Lottie animasyonlarını kullanmak için kullanıldı.  
- **device_preview:** Farklı cihaz ve ekran boyutlarında uygulamanın nasıl göründüğünü test etmek için responsive tasarım testi için kullanıldı.  

---

## Yapı ve Mimari
Uygulama **MVVM (Model-View-ViewModel)** mimarisi ile geliştirilmiştir.

---

main.dart<br>
core/<br>
├── model/<br>
│   ├── connection_stats_model.dart<br>
│   └── country_model.dart<br>
├── routes/<br>
│   ├── pages.dart<br>
│   └── routes.dart<br>
├── service/<br>
│   ├── vpn_repository.dart<br>
│   └── vpn_service.dart<br>
├── theme/<br>
│   ├── dark_theme.dart<br>
│   ├── light_theme.dart<br>
│   └── theme_controller.dart<br>
└── util/<br>
    └── app_text_styles.dart<br>

features/<br>
├── home/<br>
│   ├── view/<br>
│   │   └── home_view.dart<br>
│   ├── viewModel/<br>
│   │   ├── home_binding.dart<br>
│   │   ├── home_state.dart<br>
│   │   └── home_view_model.dart<br>
│   └── widget/<br>
│   │   └── current_connection_container.dart<br>
│   │   └── locations.dart<br>
│   │   └── top_bar_container.dart<br>
├── navigation/<br>
│   ├── view/<br>
│   │   └── navigation_view.dart<br>
│   └── viewModel/<br>
│   │   └── navigation_binding.dart<br>
│   │   └── navigation_state.dart<br>
│   │   └── navigation_view_model.dart<br>
├── search/<br>
│   ├── view/<br>
│   │   └── search_view.dart<br>
│   └── widget/<br>
│   │   └── locations_for_search.dart<br>
├── settings/<br>
│   ├── view/<br>
│   │   └── settings_view.dart<br>
│   ├── viewModel/<br>
│   │   └── settings_binding.dart<br>
│   │   └── settings_state.dart<br>
│   │   └── settings_view_model.dart<br>

product/<br>
├── constant/<br>
│   ├── product_border_radius.dart<br>
│   ├── product_box_decoration.dart<br>
│   ├── product_colors.dart<br>
│   ├── product_input_decoration.dart<br>
│   ├── product_padding.dart<br>
│   └── product_strings.dart<br>
├── extension/<br>
│   ├── image_extension.dart<br>
│   ├── lottie_extension.dart<br>
│   └── svg_extension.dart<br>
├── network/<br>
│   └── product_network_manager.dart<br>
├── util/<br>
│   └── custom_exception.dart<br>
│   └── custom_sized_box.dart<br>
│   └── custom_snackbar.dart<br>
│   └── product_utils.dart<br>


## Kurulum ve Kullanım

### Gereksinimler

- Flutter SDK >= 3.7.0  
- Dart SDK >= 2.19.0
- Visual Studio Code veya Android Studio (Tercih ettiğiniz Flutter geliştirme ortamı)  
- Android/iOS cihaz veya emülatör/simülatör
