// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '朝向克尔白与礼拜助手';

  @override
  String get navQiblah => '朝向';

  @override
  String get navPrayerTimes => '礼拜时间';

  @override
  String get navAzkar => '记念词';

  @override
  String get close => '关闭';

  @override
  String get cancel => '取消';

  @override
  String get reset => '重置';

  @override
  String get retry => '重试';

  @override
  String get done => '完成';

  @override
  String get showMore => '显示更多';

  @override
  String get showLess => '显示更少';

  @override
  String get qiblahTitle => '朝向';

  @override
  String get useCurrentLocation => '使用当前位置';

  @override
  String get changeCity => '更换城市';

  @override
  String get currentLocationSaved => '当前位置已保存';

  @override
  String get unableToGetGps => '无法获取GPS，请尝试选择城市。';

  @override
  String get locationStatusUnavailable => '无法读取位置状态';

  @override
  String get locationEnableServices => '请开启定位服务';

  @override
  String get locationEnableOrSelectCity => '请开启定位服务或选择城市';

  @override
  String get locationUnavailableSelectCity => '位置不可用，请选择城市或授予权限。';

  @override
  String get locationPermissionDenied => '位置权限被拒绝，请选择城市或授予权限。';

  @override
  String get locationPermissionDeniedForever => '位置权限被永久拒绝，请在设置中选择城市。';

  @override
  String get locationUnavailable => '位置不可用';

  @override
  String get sensorUnavailable => '此设备没有指南针传感器，无法显示朝向方向。';

  @override
  String get compassUnavailable => '指南针数据不可用，请尝试真机、设置模拟器位置或手动选择城市。';

  @override
  String get calibrationHint => '以8字形移动手机以提高指南针精度。';

  @override
  String get facingQiblah => '已朝向克尔白';

  @override
  String rotateLeft(int degrees) {
    return '向左旋转 $degrees°';
  }

  @override
  String rotateRight(int degrees) {
    return '向右旋转 $degrees°';
  }

  @override
  String get prayerTimesTitle => '礼拜时间';

  @override
  String get settings => '设置';

  @override
  String get todaysSchedule => '今日时间表';

  @override
  String get nextPrayer => '下一次礼拜';

  @override
  String get locationNotSet => '未设置位置';

  @override
  String get failedToLoadPrayerTimes => '加载礼拜时间失败';

  @override
  String get unableToCalculatePrayerTimes => '无法计算礼拜时间';

  @override
  String get selectCity => '选择城市';

  @override
  String get searchCityHint => '搜索城市或国家';

  @override
  String get calculationMethod => '计算方法';

  @override
  String get calculationMethodSubtitle => '与您当地清真寺权威机构一致';

  @override
  String get madhab => '教派（Asr时间）';

  @override
  String get fineTune => '微调（分钟）';

  @override
  String get fineTuneSubtitle => '调整以匹配当地清真寺时间表';

  @override
  String get use24Hour => '24小时制';

  @override
  String get notifications => '通知';

  @override
  String get refreshGps => '刷新GPS位置';

  @override
  String get language => '语言';

  @override
  String get languageSubtitle => '选择应用显示语言';

  @override
  String get methodMuslimWorldLeague => '穆斯林世界联盟';

  @override
  String get methodIsna => 'ISNA';

  @override
  String get methodUmmAlQura => '乌姆古拉';

  @override
  String get methodEgyptian => '埃及总署';

  @override
  String get methodKarachi => '卡拉奇大学';

  @override
  String get madhabShafi => '沙斐仪';

  @override
  String get madhabHanafi => '哈乃斐';

  @override
  String get prayerFajr => '晨礼';

  @override
  String get prayerSunrise => '日出';

  @override
  String get prayerDhuhr => '晌礼';

  @override
  String get prayerAsr => '晡礼';

  @override
  String get prayerMaghrib => '昏礼';

  @override
  String get prayerIsha => '宵礼';

  @override
  String get azkarTitle => '记念词';

  @override
  String get tasbih => '念珠';

  @override
  String get categoryMorning => '早晨';

  @override
  String get categoryEvening => '傍晚';

  @override
  String get categoryPostPrayer => '礼拜后';

  @override
  String get morningDescription => '晨礼后的早晨记念 — 《穆斯林堡垒》';

  @override
  String get eveningDescription => '晡礼后的傍晚记念 — 《穆斯林堡垒》';

  @override
  String get postPrayerDescription => '每次主命礼拜后的记念';

  @override
  String get tapToCount => '点击卡片计数重复次数';

  @override
  String get referenceQuran => '古兰经';

  @override
  String get referenceHadith => '圣训';

  @override
  String get referenceAthar => '言行录';

  @override
  String get narrator => '传述人';

  @override
  String get grade => '等级';

  @override
  String hisnNumber(int number) {
    return '堡垒 #$number';
  }

  @override
  String get tasbihTitle => '念珠计数器';

  @override
  String get tapToCountTasbih => '点击任意位置计数';

  @override
  String get tasbihMilestones => '33 和 100 的里程碑';

  @override
  String get resetCounterTitle => '重置计数器？';

  @override
  String get resetCounterMessage => '这将清除您当前的念珠会话计数。';

  @override
  String get notificationPrayerTitle => '礼拜时间';

  @override
  String notificationPrayerBody(String prayer) {
    return '该进行$prayer了';
  }

  @override
  String get langEnglish => 'English';

  @override
  String get langArabic => 'العربية';

  @override
  String get langFrench => 'Français';

  @override
  String get langUrdu => 'اردو';

  @override
  String get langTurkish => 'Türkçe';

  @override
  String get langIndonesian => 'Bahasa Indonesia';

  @override
  String get langBengali => 'বাংলা';

  @override
  String get langGerman => 'Deutsch';

  @override
  String get langSpanish => 'Español';

  @override
  String get langMalay => 'Bahasa Melayu';

  @override
  String get langPersian => 'فارسی';

  @override
  String get langHindi => 'हिन्दी';

  @override
  String get langRussian => 'Русский';

  @override
  String get langItalian => 'Italiano';

  @override
  String get langDutch => 'Nederlands';

  @override
  String get langSwahili => 'Kiswahili';

  @override
  String get langPortuguese => 'Português';

  @override
  String get langMalayalam => 'മലയാളം';

  @override
  String get langTamil => 'தமிழ்';

  @override
  String get langPunjabi => 'ਪੰਜਾਬੀ';

  @override
  String get langSomali => 'Soomaali';

  @override
  String get langUzbek => 'O\'zbek';

  @override
  String get langKazakh => 'Қазақша';

  @override
  String get langChinese => '中文';
}
