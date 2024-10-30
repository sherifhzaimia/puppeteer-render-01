# استخدم الصورة المجهزة مسبقًا لتشغيل Puppeteer مع Chrome
FROM browserless/chrome:latest

# إنشاء مجلد العمل
WORKDIR /usr/src/app

# نسخ ملفات المشروع
COPY package*.json ./

# ضبط الأذونات لتجنب مشاكل الوصول
RUN chmod -R 777 /usr/src/app

# تثبيت التبعيات
RUN npm install

# نسخ باقي ملفات المشروع
COPY . .

# تعريف المتغيرات البيئية
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable
ENV NODE_ENV=production

# تحديد المنفذ
EXPOSE 4000

# تشغيل التطبيق
CMD ["npm", "start"]

