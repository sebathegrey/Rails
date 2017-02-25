json.array! @lists, partial: 'lists/list', as: :list
json.partial! "my_lists/my_list", my_lists_id: @my_lists_id