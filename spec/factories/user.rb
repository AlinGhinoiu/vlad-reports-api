FactoryBot.define do
  factory :user do
    email { 'test@email.com' }
    encrypted_access_token { 's!mib=aY8.$u' }
    encrypted_refresh_token { '();$(|=6K[j7' }
  end
end
