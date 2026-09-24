// Index where to split the categories into two columns, so both columns hold
// about the same number of skills. A category is never split across columns.
#let split-point(categories) = {
  let counts = categories.map(c => c.abilities.len())
  if counts.len() < 2 { return counts.len() }

  let total = counts.sum()
  // Imbalance of a split after k categories: 0 means both sides are equal.
  let imbalance(k) = calc.abs(2 * counts.slice(0, k).sum() - total)
  range(1, counts.len()).sorted(key: imbalance).first()
}
