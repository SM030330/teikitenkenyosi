# ポートフォリオサイト　「点検チェッカー」

点検日を管理できるアプリケーションです．実施日と実施日のメール通知を機器ごと及びその機器の項目ごとに設定することができます．また，設定した点検日は一覧画面で実施，未実施の状態を管理できす

## 例
車を点検機器とした時，オイル交換，洗車の項目各々に実施日，実施通知日を設定することができます．また点検項目は自由に個数を増やすことができます．

予定は点検項目ごとに作業状況を管理することができます．
![](doc/images/screanshot.png)

## 開発経緯
現職で使用している分析機器の点検の管理に使用したいと考えた為．医薬品開発で使用する分析器のメンテナンス管理は申請データにも係る為，実施漏れがずれないよう管理する必要があった．数多くある機器の管理を少しでも楽におこなえるようにしたく開発に着手しました．

## 開発概要
### 1.開発環境
* 使用環境  
'Ruby', 'Ruby on Rails', 'MySQL', 'Nginx', 'Bootstrap', 'javascript', 'Github', 'docker'
  
* 使用Gem 機能実装用  
'webpacker', 'devise',  'cocoon',  'jquery-rails', 'devise-i18n', 'rails-i18n', 'dotenv-rails', 'whenever','simple_calendar', 

* 使用Gem デバック用Gem  
'byebug',  'rspec-rails', 'factory_bot_rails', 'pry-rails', 'rails-erd', 'rubocop',  'rubocop-rails',  'rubocop-airbnb'
 'capybara',  'letter_opener_web'

### 2.AWSでのデプロイ実装
* 使用した機能  
AWS VPC  
AWS RDS  
AWS EC2  
AWS EC2(ALB)  
AWS Route 53  


https://tenkenchecker.net/main/google_oauth/callback?state=%7B%22session_id%22:%22OYfedriqOCMknc39Hn9CSw%3D%3D%22,%22current_uri%22:%22https://www.tenkenchecker.net/main/google_oauth/authorize%22%7D&code=4/0Adeu5BX_pigB2osm-_EgY7zLPXfsC_5v5BmtKGfuFwp9NWNOnMbVJH_dqmQ-tzU3ca-o1Q&scope=https://www.googleapis.com/auth/drive.readonly%20https://www.googleapis.com/auth/calendar.readonly%20https://www.googleapis.com/auth/calendar