;;-------------------------------------------------
;; General
;;-------------------------------------------------

(setq load-path (append '("~/.emacs.d") load-path))

;; japanese environment
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; 起動メッセージを非表示
(setq inhibit-startup-screen t)

;; バックアップファイルの作成を禁止
(setq backup-inhibited t)

;; 終了時に自動保存ファイルを削除
(setq delete-auto-save-files t)

;; バッファ末尾に余計な改行コードを防ぐ
(setq next-line-add-newlines nil)

;; デフォルトのタブ幅
(setq-default tab-width 4)

;;----------------------------------------------------------
;; Look & Feel
;;----------------------------------------------------------

;; 行番号・列番号を表示
(line-number-mode t)
(column-number-mode t)

;; 時間を表示
(display-time)

;; 対応する括弧を強調表示
(setq show-paren-delay 0) ;; 0秒(遅延なし)で表示
(show-paren-mode t)

;; 選択リージョン範囲を可視化
(setq-default transient-mark-mode t)

;; 長い行は折り返す
(setq truncate-lines t)

;; 行間を指定
(setq-default line-spacing 0.1)

;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;----------------------------------------------------------
;; el-get
;;----------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

;;----------------------------------------------------------
;; popup
;;----------------------------------------------------------
(el-get 'sync '(popup))

;;----------------------------------------------------------
;; Auto Complete
;;----------------------------------------------------------
(el-get 'sync '(auto-complete))
(require 'auto-complete-config)
(ac-config-default)

;;----------------------------------------------------------
;; Anything
;;----------------------------------------------------------
;;(let ((original-browse-url-browser-function browse-url-browser-function))
;;  (el-get 'sync '(anything))
;;  (require 'anything-config)

