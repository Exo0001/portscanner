import net
import os
import term

const(
	ports = [21, 22, 53, 80, 101, 443, 3306, 23, 25, 50, 51, 67, 68, 69, 110, 119, 123, 135, 139, 143, 389, 989, 990, 3389]
)

fn start_scan(host string) {
	println("\033[37mStarting port scan on ${host}\n")
	mut open_port_count := 0
	mut closed_port_count := 0
	for i in ports {
		net.dial_tcp("${host}:${i}") or {
			eprintln("\033[37mPORT CLOSED [\033[31m${i}\033[37m]")
			closed_port_count += 1
			continue
		}
		println("\033[37mPORT OPEN [\033[32m${i}\033[37m]")
		open_port_count += 1
	}
	println("\033[37mNetwork scan complete | ${open_port_count} ports open | ${closed_port_count} ports closed or filtered.")
}

fn main() {
	host := os.args[1] or {
		eprintln("Missing argument! | host")
		return
	}
	term.clear()
	start_scan(host)
}