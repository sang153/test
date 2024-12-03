#!/bin/bash
f(){
  # Kiểm tra và tạo user nếu chưa tồn tại, và tạo thư mục home cho user
  for user in user1 user2 user3 user4; do
    id -u $user &>/dev/null || sudo useradd -m $user
  done

  # Kiểm tra và tạo group giamdoc nếu chưa tồn tại
  getent group giamdoc &>/dev/null || sudo groupadd giamdoc

  # Thêm user1, user2 vào group giamdoc nếu chưa có
  for user in user1 user2; do
    sudo usermod -aG giamdoc $user
  done

  # Kiểm tra và tạo thư mục lanhdao và nhanvien nếu chưa tồn tại
  sudo mkdir -p /home/lanhdao
  sudo mkdir -p /home/nhanvien

  # Áp dụng group giamdoc cho thư mục lanhdao
  sudo chown :giamdoc /home/lanhdao

  # Cấp quyền cho nhóm giamdoc có thể đọc, ghi và thực thi thư mục lanhdao
  sudo chmod 770 /home/lanhdao

  # Thông báo hoàn thành
  echo "Tạo user, nhóm và thư mục thành công!"
}

# Gọi hàm
f

