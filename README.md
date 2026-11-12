# dotfiles-audio: Linux Headphone Spatial Audio & EasyEffects Presets

Linux (PipeWire / EasyEffects) 環境で、ヘッドホン向けに**映画館やハイエンドオーディオルーム並みの「最強の立体音響」**を実現するための設定集です。

GitHubで管理・クローンして、新環境でもスクリプト1発で即時反映できるように設計されています。

---

## 🎧 収録プリセット

### 🌟 究極の立体空間（Ultimate Spatial）
- **`Ultimate-Spatial-OutOfYourHead`** (推奨・現在適用中)
  - 高級オーディオリスニングルームで実測されたHRTF（*Out of Your Head*）データを使用。
  - 「部屋のスピーカーから鳴っている」と錯覚するほどの圧倒的な頭外定位とリアルな空間感。
- **`Ultimate-Spatial-MaxxSpace`**
  - Waves MaxxSpace技術による3Dシネマ・ホール空間。シンセやボーカルが空中に浮かぶような包囲感。
- **`Ultimate-Spatial-RazerSurround`**
  - Razer Surroundによる大迫力ワイド空間＋重低音強化。

### 🎵 音楽リスニング特化（Music & Wide）
- **`Music-Crystal-UltraWide`**
  - **こもり感・残響ゼロ**。原音の解像度とパンチを100%維持したまま、Stereo Toolsで音場を左右の彼方へ爆拡（Side 140%）し、Crystalizerで高音の粒立ちを復元。
- **`Music-Punchy-Synth-Spatial`**
  - ドラム・ベース・シンセ特化EQ ＋ Dolby Atmos空間化。

### 🎮 ゲーム・映画・定番サラウンド
- **`Spatial-GSX-Gaming`**: FPS向け。名機 Sennheiser GSX 1000 の定位（足音・銃声の方位が明瞭）。
- **`Spatial-Dolby-Atmos`**: 定番シネマ空間。
- **`Spatial-Creative-XFi`**: Creative X-Fi Crystalizer & Expand。
- **`Spatial-DTS-Surround`**: DTS Headphone:X。

---

## 🚀 クローン＆インストール手順

### 1. 新しいPCや環境で一発適用する場合
```bash
git clone <あなたのGitHubリポジトリURL> ~/dotfiles-audio
cd ~/dotfiles-audio
./install.sh
```

### 2. プリセットの切り替えコマンド
ターミナルから一発で切り替え可能です：
```bash
# リアルな部屋のスピーカー空間
easyeffects -l Ultimate-Spatial-OutOfYourHead

# こもりゼロ・超高解像度ウルトラワイド
easyeffects -l Music-Crystal-UltraWide

# 3Dドーム空間
easyeffects -l Ultimate-Spatial-MaxxSpace

# FPS・足音定位
easyeffects -l Spatial-GSX-Gaming
```
※EasyEffectsのGUI（プリセット一覧）からもワンクリックで切り替えられます。

---

## 🛠️ GitHubへのPush方法

ご自身のGitHubアカウントに保存・バックアップする場合：

```bash
cd ~/dotfiles-audio

# GitHubで新しい空リポジトリ（例: dotfiles-audio）を作成後：
git remote add origin git@github.com:<あなたのユーザー名>/dotfiles-audio.git
git push -u origin main
```

---

## 💡 音割れ防止と音質設計について
すべての音楽プリセットには、急激な大音量ピークでデジタルクリッピング（音割れ）が発生しないよう、**`-6.5dB〜-7.0dB` の安全なヘッドルーム（Preampマージン）** を設けています。
音量を上げたい場合は、EasyEffects側で持ち上げるのではなく、**PC本体のマスター音量またはアンプのボリューム** を上げると、100%歪みのないピュアな高音質が得られます。
