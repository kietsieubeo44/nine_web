# Sử dụng image chính thức của Nginx
FROM nginx:latest

# Copy toàn bộ nội dung dự án vào thư mục mặc định của Nginx
COPY . /usr/share/nginx/html

# Expose cổng HTTP
EXPOSE 80
