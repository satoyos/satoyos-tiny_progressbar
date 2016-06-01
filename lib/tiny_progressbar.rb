# coding: utf-8
require 'tiny_progressbar/version'

class TinyProgressbar
  CR = "\r"
  FORMAT='[%-30s] (%03d/%03d done)'

  def initialize(goal)
    @goal = goal
    @now = 0
    display
  end
  attr_reader :goal, :now

  def succeed
    @now += 1
    back_cursor
    display
  end

  # 進捗表示を消去する
  def clear
    print CR + ' ' * 100 + CR
  end

  private

  # 同じ行に表示するためCR文字列でカーソルを戻す
  def back_cursor
    print CR
  end

  # 進捗状況を表示する
  def display
    print FORMAT % ['=' * (30 * @now / @goal), @now, @goal]
  end
end