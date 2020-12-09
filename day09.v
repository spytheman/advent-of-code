module main

fn d9_run(lines []u64, base int) u64 {
	for i := 0; i < lines.len; i++ {
		if lines.len < i + base * 2 {
			break
		}
		mut pre := []u64{}
		for j := i; j < i + base; j++ {
			pre << lines[j]
		}
		mut found := false
		for x := 0; x < pre.len; x++ {
			for y := 0; y < pre.len; y++ {
				if pre[x] != pre[y] && pre[x] + pre[y] == lines[i + base] {
					found = true
					break
				}
			}
			if found {
				break
			}
		}
		if !found {
			return lines[i + base]
		}
	}
	return 0
}

fn d9_set(lines []u64, find u64) u64 {
	for i := 0; i < lines.len; i++ {
		if lines.len < i + 4 {
			break
		}
		mut values := []u64{}
		for y := i; y < lines.len; y++ {
			values << lines[y]
			if values.len < 2 {
				continue
			}
			if values.sum() == find {
				return values.min() + values.max()
			}
		}
	}
	return 0
}

fn day09a() u64 {
	lines := read_day('day09.txt').map(it.u64())
	return d9_run(lines, 25)
}

fn day09b() u64 {
	lines := read_day('day09.txt').map(it.u64())
	return d9_set(lines, day09a())
}
