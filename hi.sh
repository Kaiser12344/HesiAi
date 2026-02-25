#!/bin/bash

# تأكد من أن الماوس فوق زر Cash Out قبل التشغيل
echo "[*] الرادار قيد الانتظار... سيتم الضغط فور ظهور (175-179)"

sudo tcpdump -l -n -i wlp2s0 host 83.147.204.244 and tcp port 443 2>/dev/null | \
awk '/length 17[5-9]/ {
    # طباعة الرقم للتأكيد
    print "[TARGET] رصد حزمة: " $NF;
    # تنفيذ الضغطة عبر نظام x11
    system("xdotool click 1");
    # التوقف قليلا لمنع الضغط المزدوج
    system("sleep 2");
    # تفريغ المخرج لضمان السرعة
    fflush();
}'
