
-- دالة التحقق من انتهاء المدة (مصححة)
function checkExpiry()
    local currentTime = os.time() -- يجب تحديث الوقت في كل مرة
    local expiryDate = os.time({year=2026, month=9, day=7}) -- التاريخ المحدد
    
    if currentTime >= expiryDate then
        print("تم انتهاء وقت الاشتراك، انظم إلى قناتنا على التيليجرام (loden11)")
        gg.alert("تم انتهاء وقت الاشتراك، انظم إلى قناتنا على التيليجرام (loden11)")
        gg.setVisible(false)
        os.exit() 
        return false
    end
    return true
end
--[[
  ===========================================
  🛠️ تم التطوير من قبل: لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶
  📢 قناة التليجرام: loden11@
  📅 تاريخ التطوير: 2026
  ===========================================
]]

-- شريط التقدم المدمج
function showProgressBar()
    -- شريط التقدم الأول مع النسب المئوية
    local progress_bars = {
        "▓▒▒▒▒▒▒▒▒▒ 10% جاري التحميل",
        "▓▓▒▒▒▒▒▒▒▒ 20% جاري التحميل",
        "▓▓▓▒▒▒▒▒▒▒ 30% جاري التحميل",
        "▓▓▓▓▒▒▒▒▒▒ 40% جاري التحميل",
        "▓▓▓▓▓▒▒▒▒▒ 50% جاري التحميل",
        "▓▓▓▓▓▓▒▒▒▒ 60% جاري التحميل",
        "▓▓▓▓▓▓▓▒▒▒ 70% جاري التحميل",
        "▓▓▓▓▓▓▓▓▒▒ 80% جاري التحميل",
        "▓▓▓▓▓▓▓▓▓▒ 90% جاري التحميل",
        "▓▓▓▓▓▓▓▓▓▓ 100% جاري التحميل"
    }
    
    for _, bar in ipairs(progress_bars) do
        gg.toast(bar)
        gg.sleep(300)
    end
    
    -- شريط التقدم الثاني مع الإيموجي
    local emoji_bars = {
        "■□□□□□□□□□ 10% ✅ جاري التهيئة",
        "■■□□□□□□□□ 20% ✅ جاري التهيئة",
        "■■■□□□□□□□ 30% ✅ جاري التهيئة",
        "■■■■□□□□□□ 40% ✅ جاري التهيئة",
        "■■■■■□□□□□ 50% ✅ جاري التهيئة",
        "■■■■■■□□□□ 60% ✅ جاري التهيئة",
        "■■■■■■■□□□ 70% ✅ جاري التهيئة",
        "■■■■■■■■□□ 80% 🔵 جاري التهيئة",
        "■■■■■■■■■□ 90% 🔵 جاري التهيئة",
        "■■■■■■■■■■ 100%✅ جاري التهيئة"
    }
    
    for _, bar in ipairs(emoji_bars) do
        gg.toast(bar)
        gg.sleep(150)
    end
    
    gg.toast("✅ السكريبت جاهز للاستخدام")
    gg.sleep(500)
end

-- عرض معلومات المطور عند بدء التشغيل
function showDeveloperInfo()
    gg.alert([[
     ================================
         تم التطوير بواسطة:
      🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶
     ================================
     قناة التليجرام: loden11@
     جميع الحقوق محفوظة © 2026
     ================================
    ]], "متابعة")
end

-- الدالة الرئيسية التي تحتوي على كلا الوظيفتين
function luckEnhancer()
    -- عرض حقوق المطور قبل البدء
    gg.toast("👑 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶")
    gg.sleep(500)
    
    -- عرض شريط التقدم المدمج
    showProgressBar()
    
    -- تشغيل الدالة الأولى (epicbox)
    epicbox()
    
    -- إضافة تأخير بسيط بين الوظيفتين
    gg.sleep(1000)
    
    -- تشغيل الدالة الثانية (من onlineMenu)
    skillgames()
    
    gg.toast("✅ تم زيادة نسبة الحظ بكلات يوم الخميس!")
    gg.sleep(1000)
    gg.toast("👑 تم التطوير بواسطة: 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶")
end

-- تعريف الدالة الأولى (epicbox) كما هي
function epicbox()
    gg["setVisible"](false)
    gg["toast"]("■□□□□□□10%")
    gg.sleep(300)
    
    -- إضافة توقيع المطور أثناء التنفيذ
    gg.toast("👑 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶")
    
    gg["setRanges"](gg.REGION_CODE_APP)
    gg["searchNumber"]("h00 01 00 b4 89 45 01 d0 29 d1 46 f9 e8 03 00 aa e0 03 1f 2a 29 55 40 b9 09 01 00 b9 c0 03 5f d6 00 00 80 12 c0 03 5f d6 00 04 00 b4 f4 0f 1e f8 f3 7b 01 a9 94 45 01 d0 94 d2 46 f9 f3 03 00 aa 1f 00 14 eb 60 02 00 54", gg.TYPE_BYTE, true, gg.SIGN_EQUAL, 0, -1, 0)
    gg["processResume"]()
    gg["getResults"](8, nil, nil, nil, nil, nil, nil, nil, nil)
    gg["editAll"]("h00 00 80 92 c0 03 5f d6", gg.TYPE_BYTE)
    gg["clearResults"]()
    
    gg["searchNumber"]("hf6 57 bd a9 f4 4f 01 a9 fd 7b 02 a9 fd 83 00 91 f4 03 01 aa e8 1b 09 32 f3 03 00 aa 88 02 00 b9 68 ba 40 f9 f5 03 02 2a e8 00 00 b4 08 09 40 b9 e9 7b 00 32 1f 01 09 6b a1 00 00 54 e0 03 1f 2a 0e 00 00 14 e0 03 1f 2a", gg.TYPE_BYTE, true, gg.SIGN_EQUAL, 0, -1, 0)
    gg["processResume"]()
    gg["getResults"](8, nil, nil, nil, nil, nil, nil, nil, nil)
    gg["editAll"]("h00 00 80 92 c0 03 5f d6", gg.TYPE_BYTE)
    gg["clearResults"]()
    
    gg["toast"]("■■■□□□□40%")
    gg.sleep(200)
    
    gg["setRanges"](gg.REGION_C_DATA)
    gg["searchNumber"]("89133724764840", gg.TYPE_QWORD)
    gg["toast"]("Gareth Bale")
    gg.toast("👑 بواسطة: 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶")
    
    local results = gg["getResults"](100)
    for i, v in ipairs(results) do
        v.value = 89133724764840
        v.freeze = false
    end
    gg["editAll"]("89133724764840", gg.TYPE_QWORD)
    gg["clearResults"]()
    
    gg["setRanges"](gg.REGION_CODE_APP)
    gg["searchNumber"]("h0a 98 42 f9 8b 5d 89 52 4b 00 a0 72 89 47 89 52 5f 69 2b 78 8b 48 89 52 49 00 a0 72 ec 1f 00 32 4b 00 a0 72 4c 69 29 f8 4c 69 2b f8 8b 49 89 52 4b 00 a0 72 4c 69 2b f8 8b 4a 89 52 4b 00 a0 72 4c 69 2b f8 8b 4b 89 52", gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1, 0)
    gg["processResume"]()
    gg["getResults"](8, nil, nil, nil, nil, nil, nil, nil, nil)
    gg["editAll"]("h00 00 80 92 c0 03 5f d6", gg.TYPE_BYTE)
    gg["clearResults"]()
    
    gg["toast"]("■■■■□□70%")
    gg.sleep(400)
    gg["toast"]("■■■■■■■■■100%")
    gg.sleep(600)
    gg["toast"](" %10")
    gg.sleep(500)
    gg["toast"](" %15")
    gg.sleep(400)
    gg["alert"]("تم تقويه نسبه الحظ ✅")
    gg["alert"]("تقوي نسبه الحظ \n\n👑 المطور: 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶\n📢 قناة التليجرام: loden11@", "OK")
end

-- تعريف الدالة الثانية (skillgames) كما هي
function skillgames()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("453737769", gg.TYPE_DWORD)
    gg.getResults(50000)
    gg.editAll("1384120329", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast(" تم تفعيل زياده نسبه الحظ ")
    gg.toast("👑 بواسطة: 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶")
end

-- دالة لإخفاء القائمة وعرض رسالة
function hideMenu()
    gg.setVisible(false)
    gg.toast("👆 اضغط على أيقونة GG لإظهار القائمة")
end

-- دالة لعرض القائمة الرئيسية
function showMainMenu()
    local menu = {
        {1, "زيادة نسبة الحظ رونالدينيو  "},
        {2, "معلومات المطور ℹ️"},
        {3, "الخروج"}
    }
    
    local choice = gg.choice(
        {"زيادة نسبة الحظ رونالدينيو   ", "معلومات المطور ℹ️", "الخروج"},
        nil,
        " تابعونا على قناتنا تلكرام  loden11\n👑 المطور: 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶"
    )
    
    if choice == 1 then
        luckEnhancer()
        gg.sleep(1000)
        return true
    elseif choice == 2 then
        showDeveloperInfo()
        return true
    elseif choice == 3 then
        gg.toast("إلى اللقاء! 🎮\n👑 المطور: 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶")
        os.exit()
    else
        -- عند الضغط على زر الإلغاء
        hideMenu()
        return false
    end
end

-- الدالة الرئيسية التي تتحكم في عرض وإخفاء القائمة
function mainMenu()
    while true do
        -- جعل النافذة مرئية أولاً
        gg.setVisible(true)
        
        -- عرض القائمة والانتظار للاختيار
        local shouldContinue = showMainMenu()
        
        if not shouldContinue then
            -- إذا تم إخفاء القائمة، ننتظر حتى يعود المستخدم
            while not gg.isVisible() do
                gg.sleep(100)
            end
            -- عندما يصبح GG مرئياً (عند الضغط على الأيقونة)، نستمر في الحلقة
        end
    end
end

-- بدء البرنامج
showDeveloperInfo()
gg.sleep(1000)
gg.alert("قناتنا على تلكرام loden11\n👑 تم التطوير بواسطة: 🇮🇶لــــــــــــــــــــــــــــــــــــــــــودن🇮🇶", "متابعة")
mainMenu()