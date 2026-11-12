# dotfiles-audio: Linux Headphone Spatial Audio & EasyEffects Presets

Linux (PipeWire / EasyEffects) 環境で、ヘッドホン向けに**映画館やハイエンドゲーミングDAC並みの「最強の立体音響」**を実現するための設定集です。

GitHubで管理・クローンして、新環境でもスクリプト1発で即時反映できるように設計されています。

---

## 🎧 特徴

1. **HeSuViの超高音質HRIR（頭部伝達インパルス応答）を完全統合**
   - 物理的な耳・頭部・空間の響きをコンボリューション（畳み込み）演算し、自然な「頭外定位（頭の外でスピーカーが鳴っているような感覚）」を作り出します。
2. **主要な立体音響エンジンのプリセットを同梱**
   - **`Spatial-Dolby-Atmos`**: 映画・アニメ・動画視聴向け。広大で包み込まれるようなシネマティック空間。
   - **`Spatial-GSX-Gaming`**: FPS・ゲーム向け。名機 Sennheiser GSX 1000 の定位アルゴリズム。足音や銃声の方位（前後左右・斜め）が最も明瞭に把握できます。
   - **`Spatial-DTS-Surround`**: 高解像度かつ自然な音場。空間オーディオ特有の不自然なこもり感が極小。
   - **`Spatial-Waves-Studio`**: スタジオモニタースピーカーを正面に置いたようなニアフィールド定位。音楽リスニング向け。
3. **安全設計（リミッター内蔵）**
   - 畳み込みによる急激な音割れやクリッピングを防ぐため、チェーン末尾に極低レイテンシーのリミッターを自動配置。

---

## 🚀 クローン＆インストール手順

### 1. このリポジトリをクローンして適用する場合（別マシンなど）
```bash
git clone <あなたのGitHubリポジトリURL> ~/dotfiles-audio
cd ~/dotfiles-audio
./install.sh
```

### 2. プリセットの切り替え方
ターミナルから一発で切り替え可能です：
```bash
# 映画・動画
easyeffects -l Spatial-Dolby-Atmos

# ゲーム・FPS
easyeffects -l Spatial-GSX-Gaming

# 音楽・リスニング
easyeffects -l Spatial-Waves-Studio

# DTS
easyeffects -l Spatial-DTS-Surround
```
もちろん、EasyEffectsのGUI（プリセット一覧）からもワンクリックでロードできます。

---

## 🛠️ GitHubへのPush方法

このリポジトリを自分のGitHubアカウントで管理したい場合の手順：

```bash
cd ~/dotfiles-audio

# GitHubで新しい空リポジトリ（例: dotfiles-audio）を作成した後：
git remote add origin git@github.com:<あなたのユーザー名>/dotfiles-audio.git
git branch -M main
git push -u origin main
```

---

## 💡 イコライザー（EQ）と立体音響をさらに極めるコツ

### なぜ今までのEQは違いを感じにくかったのか？
これまでの設定では各帯域のゲインが **+1〜3dB / -1dB 程度** と非常にマイルドでした。人間の耳は ±3dB 程度の広い帯域の変化を「音質が変わった」というより「全体の音量が少し変わった」と錯覚しやすいためです。
- 音質のキャラクターを劇的に変えたいときは、**±6dB〜10dB** ほど大胆に動かすか、狭いQ値（急峻なピーク/ディップ）で特定の周波数を狙い撃ちすると違いがはっきり分かります。

### 最強の音にするための「AutoEq」連携
立体音響（HRIR）の効果を100%発揮するには、**「ヘッドホン自体の癖（特定周波数の盛り上がりや凹み）」をフラットに整える**のが世界基準のベストプラクティスです。

1. EasyEffectsの「Equalizer」モジュールを開く
2. 右上のAutoEqアイコン（またはプリセット）から、お使いのヘッドホンの型番（例: `Sony WH-1000XM4`, `Sennheiser HD650`, `Audio-Technica ATH-M50x` など）を検索して適用
3. **接続順序**:
   ```
   [音源] → [Equalizer (AutoEqでフラット化)] → [Convolver (空間化)] → [Limiter (安全化)]
   ```
   この順序にすることで、ぼやけていた音像が一気にシャープになり、前後左右の空間の距離感が完璧になります。
