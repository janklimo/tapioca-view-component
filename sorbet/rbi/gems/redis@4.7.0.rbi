# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `redis` gem.
# Please instead update this file by running `bin/tapioca gem redis`.

class Redis
  include ::Redis::Commands::Bitmaps
  include ::Redis::Commands::Cluster
  include ::Redis::Commands::Connection
  include ::Redis::Commands::Geo
  include ::Redis::Commands::Hashes
  include ::Redis::Commands::HyperLogLog
  include ::Redis::Commands::Keys
  include ::Redis::Commands::Lists
  include ::Redis::Commands::Pubsub
  include ::Redis::Commands::Scripting
  include ::Redis::Commands::Server
  include ::Redis::Commands::Sets
  include ::Redis::Commands::SortedSets
  include ::Redis::Commands::Streams
  include ::Redis::Commands::Strings
  include ::Redis::Commands::Transactions
  include ::Redis::Commands
  include ::ActiveSupport::Cache::ConnectionPoolLike

  def initialize(options = T.unsafe(nil)); end

  def _client; end
  def close; end
  def commit; end
  def connected?; end
  def connection; end
  def disconnect!; end
  def dup; end
  def id; end
  def inspect; end
  def multi(&block); end
  def pipelined(&block); end
  def queue(*command); end
  def with; end
  def with_reconnect(val = T.unsafe(nil), &blk); end
  def without_reconnect(&blk); end

  private

  def _subscription(method, timeout, channels, block); end
  def send_blocking_command(command, timeout, &block); end
  def send_command(command, &block); end
  def synchronize; end

  class << self
    def current; end
    def current=(redis); end
    def deprecate!(message); end
    def exists_returns_integer; end
    def exists_returns_integer=(value); end
    def raise_deprecations; end
    def raise_deprecations=(_arg0); end
    def silence_deprecations; end
    def silence_deprecations=(_arg0); end
  end
end

Redis::BASE_PATH = T.let(T.unsafe(nil), String)
class Redis::BaseConnectionError < ::Redis::BaseError; end
class Redis::BaseError < ::RuntimeError; end
class Redis::CannotConnectError < ::Redis::BaseConnectionError; end

class Redis::Client
  def initialize(options = T.unsafe(nil)); end

  def call(command); end
  def call_loop(command, timeout = T.unsafe(nil)); end
  def call_pipeline(pipeline); end
  def call_pipelined(pipeline); end
  def call_with_timeout(command, extra_timeout, &blk); end
  def call_without_timeout(command, &blk); end
  def close; end
  def command_map; end
  def connect; end
  def connect_timeout; end
  def connected?; end
  def connection; end
  def db; end
  def db=(db); end
  def disconnect; end
  def driver; end
  def host; end
  def id; end
  def inherit_socket?; end
  def io; end
  def location; end
  def logger; end
  def logger=(_arg0); end
  def options; end
  def password; end
  def path; end
  def port; end
  def process(commands); end
  def read; end
  def read_timeout; end
  def reconnect; end
  def scheme; end
  def timeout; end
  def username; end
  def with_reconnect(val = T.unsafe(nil)); end
  def with_socket_timeout(timeout); end
  def without_reconnect(&blk); end
  def without_socket_timeout(&blk); end
  def write(command); end

  protected

  def _parse_driver(driver); end
  def _parse_options(options); end
  def ensure_connected; end
  def establish_connection; end
  def logging(commands); end
end

class Redis::Client::Connector
  def initialize(options); end

  def check(client); end
  def resolve; end
end

class Redis::Client::Connector::Sentinel < ::Redis::Client::Connector
  def initialize(options); end

  def check(client); end
  def resolve; end
  def resolve_master; end
  def resolve_slave; end
  def sentinel_detect; end
end

Redis::Client::DEFAULTS = T.let(T.unsafe(nil), Hash)

class Redis::Cluster
  def initialize(options = T.unsafe(nil)); end

  def call(command, &block); end
  def call_loop(command, timeout = T.unsafe(nil), &block); end
  def call_pipeline(pipeline); end
  def call_with_timeout(command, timeout, &block); end
  def call_without_timeout(command, &block); end
  def connected?; end
  def connection_info; end
  def db; end
  def db=(_db); end
  def disconnect; end
  def id; end
  def process(commands, &block); end
  def timeout; end
  def with_reconnect(val = T.unsafe(nil), &block); end

  private

  def _scan(command, &block); end
  def assign_asking_node(err_msg); end
  def assign_node(command); end
  def assign_redirection_node(err_msg); end
  def fetch_cluster_info!(option); end
  def fetch_command_details(nodes); end
  def find_node(node_key); end
  def find_node_key(command, primary_only: T.unsafe(nil)); end
  def send_client_command(command, &block); end
  def send_cluster_command(command, &block); end
  def send_command(command, &block); end
  def send_config_command(command, &block); end
  def send_memory_command(command, &block); end
  def send_pubsub_command(command, &block); end
  def send_script_command(command, &block); end
  def try_send(node, method_name, *args, retry_count: T.unsafe(nil), &block); end
  def update_cluster_info!(node_key = T.unsafe(nil)); end
end

class Redis::Cluster::AmbiguousNodeError < ::Redis::BaseError
  def initialize(command); end
end

class Redis::Cluster::Command
  def initialize(details); end

  def extract_first_key(command); end
  def should_send_to_master?(command); end
  def should_send_to_slave?(command); end

  private

  def determine_first_key_position(command); end
  def determine_optional_key_position(command, option_name); end
  def dig_details(command, key); end
  def extract_hash_tag(key); end
  def pick_details(details); end
end

class Redis::Cluster::CommandErrorCollection < ::Redis::BaseError
  def initialize(errors, error_message = T.unsafe(nil)); end

  def errors; end
end

module Redis::Cluster::CommandLoader
  private

  def fetch_command_details(node); end
  def load(nodes); end

  class << self
    def load(nodes); end

    private

    def fetch_command_details(node); end
  end
end

class Redis::Cluster::CrossSlotPipeliningError < ::Redis::BaseError
  def initialize(keys); end
end

class Redis::Cluster::InitialSetupError < ::Redis::BaseError
  def initialize(errors); end
end

module Redis::Cluster::KeySlotConverter
  private

  def convert(key); end

  class << self
    def convert(key); end
  end
end

Redis::Cluster::KeySlotConverter::HASH_SLOTS = T.let(T.unsafe(nil), Integer)
Redis::Cluster::KeySlotConverter::XMODEM_CRC16_LOOKUP = T.let(T.unsafe(nil), Array)

class Redis::Cluster::Node
  include ::Enumerable

  def initialize(options, node_flags = T.unsafe(nil), with_replica = T.unsafe(nil)); end

  def call_all(command, &block); end
  def call_master(command, &block); end
  def call_slave(command, &block); end
  def each(&block); end
  def find_by(node_key); end
  def process_all(commands, &block); end
  def sample; end
  def scale_reading_clients; end

  private

  def build_clients(options); end
  def master?(node_key); end
  def replica_disabled?; end
  def slave?(node_key); end
  def try_map; end
end

Redis::Cluster::Node::ROLE_SLAVE = T.let(T.unsafe(nil), String)
class Redis::Cluster::Node::ReloadNeeded < ::StandardError; end

module Redis::Cluster::NodeKey
  private

  def build_from_host_port(host, port); end
  def build_from_uri(uri); end
  def optionize(node_key); end
  def split(node_key); end

  class << self
    def build_from_host_port(host, port); end
    def build_from_uri(uri); end
    def optionize(node_key); end
    def split(node_key); end
  end
end

Redis::Cluster::NodeKey::DELIMITER = T.let(T.unsafe(nil), String)

module Redis::Cluster::NodeLoader
  private

  def fetch_node_info(node); end
  def load_flags(nodes); end

  class << self
    def load_flags(nodes); end

    private

    def fetch_node_info(node); end
  end
end

class Redis::Cluster::Option
  def initialize(options); end

  def add_node(host, port); end
  def per_node_key; end
  def update_node(addrs); end
  def use_replica?; end

  private

  def add_common_node_option_if_needed(options, node_opts, key); end
  def build_node_options(addrs); end
  def parse_node_addr(addr); end
  def parse_node_option(addr); end
  def parse_node_url(addr); end
end

Redis::Cluster::Option::DEFAULT_SCHEME = T.let(T.unsafe(nil), String)
Redis::Cluster::Option::SECURE_SCHEME = T.let(T.unsafe(nil), String)
Redis::Cluster::Option::VALID_SCHEMES = T.let(T.unsafe(nil), Array)

class Redis::Cluster::OrchestrationCommandNotSupported < ::Redis::BaseError
  def initialize(command, subcommand = T.unsafe(nil)); end
end

class Redis::Cluster::Slot
  def initialize(available_slots, node_flags = T.unsafe(nil), with_replica = T.unsafe(nil)); end

  def exists?(slot); end
  def find_node_key_of_master(slot); end
  def find_node_key_of_slave(slot); end
  def put(slot, node_key); end

  private

  def build_slot_node_key_map(available_slots); end
  def master?(node_key); end
  def replica_disabled?; end
  def slave?(node_key); end
end

Redis::Cluster::Slot::ROLE_SLAVE = T.let(T.unsafe(nil), String)

module Redis::Cluster::SlotLoader
  private

  def fetch_slot_info(node); end
  def load(nodes); end
  def parse_slot_info(arr, default_ip:); end
  def stringify_node_key(arr, default_ip); end

  class << self
    def load(nodes); end

    private

    def fetch_slot_info(node); end
    def parse_slot_info(arr, default_ip:); end
    def stringify_node_key(arr, default_ip); end
  end
end

class Redis::CommandError < ::Redis::BaseError; end

module Redis::Commands
  include ::Redis::Commands::Bitmaps
  include ::Redis::Commands::Cluster
  include ::Redis::Commands::Connection
  include ::Redis::Commands::Geo
  include ::Redis::Commands::Hashes
  include ::Redis::Commands::HyperLogLog
  include ::Redis::Commands::Keys
  include ::Redis::Commands::Lists
  include ::Redis::Commands::Pubsub
  include ::Redis::Commands::Scripting
  include ::Redis::Commands::Server
  include ::Redis::Commands::Sets
  include ::Redis::Commands::SortedSets
  include ::Redis::Commands::Streams
  include ::Redis::Commands::Strings
  include ::Redis::Commands::Transactions

  def call(*command); end
  def sentinel(subcommand, *args); end

  private

  def method_missing(*command); end
end

module Redis::Commands::Bitmaps
  def bitcount(key, start = T.unsafe(nil), stop = T.unsafe(nil)); end
  def bitop(operation, destkey, *keys); end
  def bitpos(key, bit, start = T.unsafe(nil), stop = T.unsafe(nil)); end
  def getbit(key, offset); end
  def setbit(key, offset, value); end
end

Redis::Commands::Boolify = T.let(T.unsafe(nil), Proc)
Redis::Commands::BoolifySet = T.let(T.unsafe(nil), Proc)

module Redis::Commands::Cluster
  def asking; end
  def cluster(subcommand, *args); end
end

module Redis::Commands::Connection
  def auth(*args); end
  def echo(value); end
  def ping(message = T.unsafe(nil)); end
  def quit; end
  def select(db); end
end

Redis::Commands::EMPTY_STREAM_RESPONSE = T.let(T.unsafe(nil), Array)
Redis::Commands::Floatify = T.let(T.unsafe(nil), Proc)
Redis::Commands::FloatifyPairs = T.let(T.unsafe(nil), Proc)

module Redis::Commands::Geo
  def geoadd(key, *member); end
  def geodist(key, member1, member2, unit = T.unsafe(nil)); end
  def geohash(key, member); end
  def geopos(key, member); end
  def georadius(*args, **geoptions); end
  def georadiusbymember(*args, **geoptions); end

  private

  def _geoarguments(*args, options: T.unsafe(nil), sort: T.unsafe(nil), count: T.unsafe(nil)); end
end

module Redis::Commands::Hashes
  def hdel(key, *fields); end
  def hexists(key, field); end
  def hget(key, field); end
  def hgetall(key); end
  def hincrby(key, field, increment); end
  def hincrbyfloat(key, field, increment); end
  def hkeys(key); end
  def hlen(key); end
  def hmget(key, *fields, &blk); end
  def hmset(key, *attrs); end
  def hrandfield(key, count = T.unsafe(nil), withvalues: T.unsafe(nil), with_values: T.unsafe(nil)); end
  def hscan(key, cursor, **options); end
  def hscan_each(key, **options, &block); end
  def hset(key, *attrs); end
  def hsetnx(key, field, value); end
  def hvals(key); end
  def mapped_hmget(key, *fields); end
  def mapped_hmset(key, hash); end
end

Redis::Commands::Hashify = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyClusterNodeInfo = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyClusterNodes = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyClusterSlaves = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyClusterSlots = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyInfo = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyStreamAutoclaim = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyStreamAutoclaimJustId = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyStreamEntries = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyStreamPendingDetails = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyStreamPendings = T.let(T.unsafe(nil), Proc)
Redis::Commands::HashifyStreams = T.let(T.unsafe(nil), Proc)

module Redis::Commands::HyperLogLog
  def pfadd(key, member); end
  def pfcount(*keys); end
  def pfmerge(dest_key, *source_key); end
end

module Redis::Commands::Keys
  def _exists(*keys); end
  def copy(source, destination, db: T.unsafe(nil), replace: T.unsafe(nil)); end
  def del(*keys); end
  def dump(key); end
  def exists(*keys); end
  def exists?(*keys); end
  def expire(key, seconds); end
  def expireat(key, unix_time); end
  def keys(pattern = T.unsafe(nil)); end
  def migrate(key, options); end
  def move(key, db); end
  def object(*args); end
  def persist(key); end
  def pexpire(key, milliseconds); end
  def pexpireat(key, ms_unix_time); end
  def pttl(key); end
  def randomkey; end
  def rename(old_name, new_name); end
  def renamenx(old_name, new_name); end
  def restore(key, ttl, serialized_value, replace: T.unsafe(nil)); end
  def scan(cursor, **options); end
  def scan_each(**options, &block); end
  def sort(key, by: T.unsafe(nil), limit: T.unsafe(nil), get: T.unsafe(nil), order: T.unsafe(nil), store: T.unsafe(nil)); end
  def ttl(key); end
  def type(key); end
  def unlink(*keys); end

  private

  def _scan(command, cursor, args, match: T.unsafe(nil), count: T.unsafe(nil), type: T.unsafe(nil), &block); end
end

module Redis::Commands::Lists
  def blmove(source, destination, where_source, where_destination, timeout: T.unsafe(nil)); end
  def blpop(*args); end
  def brpop(*args); end
  def brpoplpush(source, destination, deprecated_timeout = T.unsafe(nil), timeout: T.unsafe(nil)); end
  def lindex(key, index); end
  def linsert(key, where, pivot, value); end
  def llen(key); end
  def lmove(source, destination, where_source, where_destination); end
  def lpop(key, count = T.unsafe(nil)); end
  def lpush(key, value); end
  def lpushx(key, value); end
  def lrange(key, start, stop); end
  def lrem(key, count, value); end
  def lset(key, index, value); end
  def ltrim(key, start, stop); end
  def rpop(key, count = T.unsafe(nil)); end
  def rpoplpush(source, destination); end
  def rpush(key, value); end
  def rpushx(key, value); end

  private

  def _bpop(cmd, args, &blk); end
  def _normalize_move_wheres(where_source, where_destination); end
end

Redis::Commands::Noop = T.let(T.unsafe(nil), Proc)
Redis::Commands::Pairify = T.let(T.unsafe(nil), Proc)

module Redis::Commands::Pubsub
  def psubscribe(*channels, &block); end
  def psubscribe_with_timeout(timeout, *channels, &block); end
  def publish(channel, message); end
  def pubsub(subcommand, *args); end
  def punsubscribe(*channels); end
  def subscribe(*channels, &block); end
  def subscribe_with_timeout(timeout, *channels, &block); end
  def subscribed?; end
  def unsubscribe(*channels); end
end

module Redis::Commands::Scripting
  def eval(*args); end
  def evalsha(*args); end
  def script(subcommand, *args); end

  private

  def _eval(cmd, args); end
end

module Redis::Commands::Server
  def bgrewriteaof; end
  def bgsave; end
  def client(subcommand = T.unsafe(nil), *args); end
  def config(action, *args); end
  def dbsize; end
  def debug(*args); end
  def flushall(options = T.unsafe(nil)); end
  def flushdb(options = T.unsafe(nil)); end
  def info(cmd = T.unsafe(nil)); end
  def lastsave; end
  def monitor(&block); end
  def save; end
  def shutdown; end
  def slaveof(host, port); end
  def slowlog(subcommand, length = T.unsafe(nil)); end
  def sync; end
  def time; end
end

module Redis::Commands::Sets
  def sadd(key, member); end
  def scard(key); end
  def sdiff(*keys); end
  def sdiffstore(destination, *keys); end
  def sinter(*keys); end
  def sinterstore(destination, *keys); end
  def sismember(key, member); end
  def smembers(key); end
  def smismember(key, *members); end
  def smove(source, destination, member); end
  def spop(key, count = T.unsafe(nil)); end
  def srandmember(key, count = T.unsafe(nil)); end
  def srem(key, member); end
  def sscan(key, cursor, **options); end
  def sscan_each(key, **options, &block); end
  def sunion(*keys); end
  def sunionstore(destination, *keys); end
end

module Redis::Commands::SortedSets
  def bzpopmax(*args); end
  def bzpopmin(*args); end
  def zadd(key, *args, nx: T.unsafe(nil), xx: T.unsafe(nil), lt: T.unsafe(nil), gt: T.unsafe(nil), ch: T.unsafe(nil), incr: T.unsafe(nil)); end
  def zcard(key); end
  def zcount(key, min, max); end
  def zdiff(*keys, with_scores: T.unsafe(nil)); end
  def zdiffstore(*args); end
  def zincrby(key, increment, member); end
  def zinter(*args); end
  def zinterstore(*args); end
  def zlexcount(key, min, max); end
  def zmscore(key, *members); end
  def zpopmax(key, count = T.unsafe(nil)); end
  def zpopmin(key, count = T.unsafe(nil)); end
  def zrandmember(key, count = T.unsafe(nil), withscores: T.unsafe(nil), with_scores: T.unsafe(nil)); end
  def zrange(key, start, stop, byscore: T.unsafe(nil), by_score: T.unsafe(nil), bylex: T.unsafe(nil), by_lex: T.unsafe(nil), rev: T.unsafe(nil), limit: T.unsafe(nil), withscores: T.unsafe(nil), with_scores: T.unsafe(nil)); end
  def zrangebylex(key, min, max, limit: T.unsafe(nil)); end
  def zrangebyscore(key, min, max, withscores: T.unsafe(nil), with_scores: T.unsafe(nil), limit: T.unsafe(nil)); end
  def zrangestore(dest_key, src_key, start, stop, byscore: T.unsafe(nil), by_score: T.unsafe(nil), bylex: T.unsafe(nil), by_lex: T.unsafe(nil), rev: T.unsafe(nil), limit: T.unsafe(nil)); end
  def zrank(key, member); end
  def zrem(key, member); end
  def zremrangebyrank(key, start, stop); end
  def zremrangebyscore(key, min, max); end
  def zrevrange(key, start, stop, withscores: T.unsafe(nil), with_scores: T.unsafe(nil)); end
  def zrevrangebylex(key, max, min, limit: T.unsafe(nil)); end
  def zrevrangebyscore(key, max, min, withscores: T.unsafe(nil), with_scores: T.unsafe(nil), limit: T.unsafe(nil)); end
  def zrevrank(key, member); end
  def zscan(key, cursor, **options); end
  def zscan_each(key, **options, &block); end
  def zscore(key, member); end
  def zunion(*args); end
  def zunionstore(*args); end

  private

  def _zsets_operation(cmd, *keys, weights: T.unsafe(nil), aggregate: T.unsafe(nil), with_scores: T.unsafe(nil)); end
  def _zsets_operation_store(cmd, destination, keys, weights: T.unsafe(nil), aggregate: T.unsafe(nil)); end
end

module Redis::Commands::Streams
  def xack(key, group, *ids); end
  def xadd(key, entry, approximate: T.unsafe(nil), maxlen: T.unsafe(nil), id: T.unsafe(nil)); end
  def xautoclaim(key, group, consumer, min_idle_time, start, count: T.unsafe(nil), justid: T.unsafe(nil)); end
  def xclaim(key, group, consumer, min_idle_time, *ids, **opts); end
  def xdel(key, *ids); end
  def xgroup(subcommand, key, group, id_or_consumer = T.unsafe(nil), mkstream: T.unsafe(nil)); end
  def xinfo(subcommand, key, group = T.unsafe(nil)); end
  def xlen(key); end
  def xpending(key, group, *args); end
  def xrange(key, start = T.unsafe(nil), range_end = T.unsafe(nil), count: T.unsafe(nil)); end
  def xread(keys, ids, count: T.unsafe(nil), block: T.unsafe(nil)); end
  def xreadgroup(group, consumer, keys, ids, count: T.unsafe(nil), block: T.unsafe(nil), noack: T.unsafe(nil)); end
  def xrevrange(key, range_end = T.unsafe(nil), start = T.unsafe(nil), count: T.unsafe(nil)); end
  def xtrim(key, maxlen, approximate: T.unsafe(nil)); end

  private

  def _xread(args, keys, ids, blocking_timeout_msec); end
end

module Redis::Commands::Strings
  def append(key, value); end
  def decr(key); end
  def decrby(key, decrement); end
  def get(key); end
  def getdel(key); end
  def getex(key, ex: T.unsafe(nil), px: T.unsafe(nil), exat: T.unsafe(nil), pxat: T.unsafe(nil), persist: T.unsafe(nil)); end
  def getrange(key, start, stop); end
  def getset(key, value); end
  def incr(key); end
  def incrby(key, increment); end
  def incrbyfloat(key, increment); end
  def mapped_mget(*keys); end
  def mapped_mset(hash); end
  def mapped_msetnx(hash); end
  def mget(*keys, &blk); end
  def mset(*args); end
  def msetnx(*args); end
  def psetex(key, ttl, value); end
  def set(key, value, ex: T.unsafe(nil), px: T.unsafe(nil), exat: T.unsafe(nil), pxat: T.unsafe(nil), nx: T.unsafe(nil), xx: T.unsafe(nil), keepttl: T.unsafe(nil), get: T.unsafe(nil)); end
  def setex(key, ttl, value); end
  def setnx(key, value); end
  def setrange(key, offset, value); end
  def strlen(key); end
end

module Redis::Commands::Transactions
  def discard; end
  def exec; end
  def multi(&block); end
  def unwatch; end
  def watch(*keys); end
end

module Redis::Connection
  class << self
    def drivers; end
  end
end

module Redis::Connection::CommandHelper
  def build_command(args); end

  protected

  def encode(string); end
end

Redis::Connection::CommandHelper::COMMAND_DELIMITER = T.let(T.unsafe(nil), String)

class Redis::Connection::Ruby
  include ::Redis::Connection::CommandHelper

  def initialize(sock); end

  def connected?; end
  def disconnect; end
  def format_bulk_reply(line); end
  def format_error_reply(line); end
  def format_integer_reply(line); end
  def format_multi_bulk_reply(line); end
  def format_reply(reply_type, line); end
  def format_status_reply(line); end
  def get_tcp_keepalive; end
  def read; end
  def set_tcp_keepalive(keepalive); end
  def set_tcp_nodelay; end
  def timeout=(timeout); end
  def write(command); end
  def write_timeout=(timeout); end

  class << self
    def connect(config); end
  end
end

Redis::Connection::Ruby::ASTERISK = T.let(T.unsafe(nil), String)
Redis::Connection::Ruby::COLON = T.let(T.unsafe(nil), String)
Redis::Connection::Ruby::DOLLAR = T.let(T.unsafe(nil), String)
Redis::Connection::Ruby::MINUS = T.let(T.unsafe(nil), String)
Redis::Connection::Ruby::PLUS = T.let(T.unsafe(nil), String)

class Redis::Connection::SSLSocket < ::OpenSSL::SSL::SSLSocket
  include ::Redis::Connection::SocketMixin

  def wait_readable(timeout = T.unsafe(nil)); end
  def wait_writable(timeout = T.unsafe(nil)); end

  class << self
    def connect(host, port, timeout, ssl_params); end
  end
end

module Redis::Connection::SocketMixin
  def initialize(*args); end

  def _read_from_socket(nbytes, buffer = T.unsafe(nil)); end
  def gets; end
  def read(nbytes); end
  def timeout=(timeout); end
  def write(buffer); end
  def write_timeout=(timeout); end
end

Redis::Connection::SocketMixin::CRLF = T.let(T.unsafe(nil), String)

class Redis::Connection::TCPSocket < ::Socket
  include ::Redis::Connection::SocketMixin

  class << self
    def connect(host, port, timeout); end
    def connect_addrinfo(addrinfo, port, timeout); end
  end
end

class Redis::Connection::UNIXSocket < ::Socket
  include ::Redis::Connection::SocketMixin

  class << self
    def connect(path, timeout); end
  end
end

class Redis::ConnectionError < ::Redis::BaseConnectionError; end
class Redis::Deprecated < ::StandardError; end

class Redis::DeprecatedMulti
  def initialize(pipeline); end

  def __getobj__; end
end

class Redis::DeprecatedPipeline
  def initialize(pipeline); end

  def __getobj__; end
end

class Redis::Distributed
  include ::ActiveSupport::Cache::ConnectionPoolLike

  def initialize(node_configs, options = T.unsafe(nil)); end

  def [](key); end
  def []=(key, value); end
  def _bpop(cmd, args); end
  def _eval(cmd, args); end
  def add_node(options); end
  def append(key, value); end
  def bgsave; end
  def bitcount(key, start = T.unsafe(nil), stop = T.unsafe(nil)); end
  def bitop(operation, destkey, *keys); end
  def bitpos(key, bit, start = T.unsafe(nil), stop = T.unsafe(nil)); end
  def blmove(source, destination, where_source, where_destination, timeout: T.unsafe(nil)); end
  def blpop(*args); end
  def brpop(*args); end
  def brpoplpush(source, destination, deprecated_timeout = T.unsafe(nil), **options); end
  def copy(source, destination, **options); end
  def dbsize; end
  def decr(key); end
  def decrby(key, decrement); end
  def del(*args); end
  def discard; end
  def dump(key); end
  def dup; end
  def echo(value); end
  def eval(*args); end
  def evalsha(*args); end
  def exec; end
  def exists(*args); end
  def exists?(*args); end
  def expire(key, seconds); end
  def expireat(key, unix_time); end
  def flushall; end
  def flushdb; end
  def get(key); end
  def getbit(key, offset); end
  def getdel(key); end
  def getex(key, **options); end
  def getrange(key, start, stop); end
  def getset(key, value); end
  def hdel(key, *fields); end
  def hexists(key, field); end
  def hget(key, field); end
  def hgetall(key); end
  def hincrby(key, field, increment); end
  def hincrbyfloat(key, field, increment); end
  def hkeys(key); end
  def hlen(key); end
  def hmget(key, *fields); end
  def hmset(key, *attrs); end
  def hrandfield(key, count = T.unsafe(nil), **options); end
  def hset(key, *attrs); end
  def hsetnx(key, field, value); end
  def hvals(key); end
  def incr(key); end
  def incrby(key, increment); end
  def incrbyfloat(key, increment); end
  def info(cmd = T.unsafe(nil)); end
  def inspect; end
  def keys(glob = T.unsafe(nil)); end
  def lastsave; end
  def lindex(key, index); end
  def linsert(key, where, pivot, value); end
  def llen(key); end
  def lmove(source, destination, where_source, where_destination); end
  def lpop(key, count = T.unsafe(nil)); end
  def lpush(key, value); end
  def lpushx(key, value); end
  def lrange(key, start, stop); end
  def lrem(key, count, value); end
  def lset(key, index, value); end
  def ltrim(key, start, stop); end
  def mapped_hmget(key, *fields); end
  def mapped_hmset(key, hash); end
  def mapped_mget(*keys); end
  def mapped_mset(_hash); end
  def mapped_msetnx(_hash); end
  def mget(*keys); end
  def migrate(_key, _options); end
  def monitor; end
  def move(key, db); end
  def mset(*_args); end
  def msetnx(*_args); end
  def multi(&block); end
  def node_for(key); end
  def nodes; end
  def persist(key); end
  def pexpire(key, milliseconds); end
  def pexpireat(key, ms_unix_time); end
  def pfadd(key, member); end
  def pfcount(*keys); end
  def pfmerge(dest_key, *source_key); end
  def ping; end
  def pipelined; end
  def psetex(key, ttl, value); end
  def psubscribe(*channels, &block); end
  def pttl(key); end
  def publish(channel, message); end
  def punsubscribe(*channels); end
  def quit; end
  def randomkey; end
  def rename(old_name, new_name); end
  def renamenx(old_name, new_name); end
  def restore(key, ttl, serialized_value, **options); end
  def ring; end
  def rpop(key, count = T.unsafe(nil)); end
  def rpoplpush(source, destination); end
  def rpush(key, value); end
  def rpushx(key, value); end
  def sadd(key, member); end
  def save; end
  def scard(key); end
  def script(subcommand, *args); end
  def sdiff(*keys); end
  def sdiffstore(destination, *keys); end
  def select(db); end
  def set(key, value, **options); end
  def setbit(key, offset, value); end
  def setex(key, ttl, value); end
  def setnx(key, value); end
  def setrange(key, offset, value); end
  def sinter(*keys); end
  def sinterstore(destination, *keys); end
  def sismember(key, member); end
  def smembers(key); end
  def smismember(key, *members); end
  def smove(source, destination, member); end
  def sort(key, **options); end
  def spop(key, count = T.unsafe(nil)); end
  def srandmember(key, count = T.unsafe(nil)); end
  def srem(key, member); end
  def sscan(key, cursor, **options); end
  def sscan_each(key, **options, &block); end
  def strlen(key); end
  def subscribe(channel, *channels, &block); end
  def subscribed?; end
  def sunion(*keys); end
  def sunionstore(destination, *keys); end
  def time; end
  def ttl(key); end
  def type(key); end
  def unlink(*args); end
  def unsubscribe(*channels); end
  def unwatch; end
  def watch(*keys, &block); end
  def zadd(key, *args); end
  def zcard(key); end
  def zcount(key, min, max); end
  def zdiff(*keys, **options); end
  def zdiffstore(destination, keys, **options); end
  def zincrby(key, increment, member); end
  def zinter(*keys, **options); end
  def zinterstore(destination, keys, **options); end
  def zmscore(key, *members); end
  def zrandmember(key, count = T.unsafe(nil), **options); end
  def zrange(key, start, stop, **options); end
  def zrangebyscore(key, min, max, **options); end
  def zrangestore(dest_key, src_key, start, stop, **options); end
  def zrank(key, member); end
  def zrem(key, member); end
  def zremrangebyrank(key, start, stop); end
  def zremrangebyscore(key, min, max); end
  def zrevrange(key, start, stop, **options); end
  def zrevrangebyscore(key, max, min, **options); end
  def zrevrank(key, member); end
  def zscore(key, member); end
  def zunion(*keys, **options); end
  def zunionstore(destination, keys, **options); end

  protected

  def ensure_same_node(command, keys); end
  def key_tag(key); end
  def node_index_for(key); end
  def on_each_node(command, *args); end
end

class Redis::Distributed::CannotDistribute < ::RuntimeError
  def initialize(command); end

  def message; end
end

class Redis::Future < ::BasicObject
  def initialize(command, transformation, timeout); end

  def ==(_other); end
  def _command; end
  def _set(object); end
  def class; end
  def inspect; end
  def is_a?(other); end
  def timeout; end
  def value; end
end

Redis::Future::FutureNotReady = T.let(T.unsafe(nil), Redis::FutureNotReady)

class Redis::FutureNotReady < ::RuntimeError
  def initialize; end
end

class Redis::HashRing
  def initialize(nodes = T.unsafe(nil), replicas = T.unsafe(nil)); end

  def add_node(node); end
  def get_node(key); end
  def get_node_pos(key); end
  def iter_nodes(key); end
  def nodes; end
  def remove_node(node); end
  def replicas; end
  def ring; end
  def sorted_keys; end

  class << self
    def binary_search(ary, value); end
  end
end

Redis::HashRing::POINTS_PER_SERVER = T.let(T.unsafe(nil), Integer)
class Redis::InheritedError < ::Redis::BaseConnectionError; end
class Redis::InvalidClientOptionError < ::Redis::BaseError; end

class Redis::MultiFuture < ::Redis::Future
  def initialize(futures); end

  def _set(replies); end
end

class Redis::Pipeline
  def initialize(client); end

  def call(command, timeout: T.unsafe(nil), &block); end
  def call_pipeline(pipeline); end
  def call_with_timeout(command, timeout, &block); end
  def client; end
  def commands; end
  def db; end
  def db=(_arg0); end
  def empty?; end
  def finish(replies, &blk); end
  def futures; end
  def materialized_futures; end
  def shutdown?; end
  def timeout; end
  def timeouts; end
  def with_reconnect(val = T.unsafe(nil)); end
  def with_reconnect?; end
  def without_reconnect(&blk); end
  def without_reconnect?; end

  class << self
    def deprecation_warning(method, caller_locations); end
  end
end

class Redis::Pipeline::Multi < ::Redis::Pipeline
  def commands; end
  def finish(replies); end
  def materialized_futures; end
  def timeouts; end
end

Redis::Pipeline::REDIS_INTERNAL_PATH = T.let(T.unsafe(nil), String)
Redis::Pipeline::STDLIB_PATH = T.let(T.unsafe(nil), String)

class Redis::PipelinedConnection
  include ::Redis::Commands::Bitmaps
  include ::Redis::Commands::Cluster
  include ::Redis::Commands::Connection
  include ::Redis::Commands::Geo
  include ::Redis::Commands::Hashes
  include ::Redis::Commands::HyperLogLog
  include ::Redis::Commands::Keys
  include ::Redis::Commands::Lists
  include ::Redis::Commands::Pubsub
  include ::Redis::Commands::Scripting
  include ::Redis::Commands::Server
  include ::Redis::Commands::Sets
  include ::Redis::Commands::SortedSets
  include ::Redis::Commands::Streams
  include ::Redis::Commands::Strings
  include ::Redis::Commands::Transactions
  include ::Redis::Commands

  def initialize(pipeline); end

  def call_pipeline(pipeline); end
  def db; end
  def db=(db); end
  def pipelined; end

  private

  def send_blocking_command(command, timeout, &block); end
  def send_command(command, &block); end
  def synchronize; end
end

class Redis::ProtocolError < ::Redis::BaseError
  def initialize(reply_type); end
end

class Redis::SubscribedClient
  def initialize(client); end

  def call(command); end
  def psubscribe(*channels, &block); end
  def psubscribe_with_timeout(timeout, *channels, &block); end
  def punsubscribe(*channels); end
  def subscribe(*channels, &block); end
  def subscribe_with_timeout(timeout, *channels, &block); end
  def unsubscribe(*channels); end

  protected

  def subscription(start, stop, channels, block, timeout = T.unsafe(nil)); end
end

class Redis::Subscription
  def initialize; end

  def callbacks; end
  def message(&block); end
  def pmessage(&block); end
  def psubscribe(&block); end
  def punsubscribe(&block); end
  def subscribe(&block); end
  def unsubscribe(&block); end
end

class Redis::TimeoutError < ::Redis::BaseConnectionError; end
Redis::VERSION = T.let(T.unsafe(nil), String)
